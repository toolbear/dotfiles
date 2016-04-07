require 'net/http'
require 'json'

Facter.add('authorized_keys') do
  def public_keys()
    get_json "https://api.github.com/user/keys"
  end

  def get_json(url)
    token = Facter.value(:github_token)
    url << "?access_token=#{token}" if token
    uri = URI.parse(url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true

    headers = {
      'Accept' => 'application/vnd.github.v3+json'
    }
    headers['Authorization'] = "token #{token}" if token
    request = Net::HTTP::Get.new(uri.request_uri, headers)

    resp = http.request(request)
    data = resp.body

    if resp.code.to_i == 403
      begin
        message = JSON.parse(data)['message']
        if message.include? 'API rate limit exceeded'
          raise Error, message
        end
        rescue JSON::ParserError
          # 403 response does not return json, skip.
      end
    elsif resp.code.to_i != 200
      nil
    else
      JSON.parse(data)
    end
  end

  setcode do
    keys = public_keys
    if keys and keys.first then
      keys.find_all{ |k|
        k['verified'] == true and k['title'] == Facter.value(:id)
      }.map{ |k|
        "#{k['key']} #{k['title']}"
      }.join("\n")
    end
  end
end
