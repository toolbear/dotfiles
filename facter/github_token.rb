require 'yaml'

me = Facter.value(:id)

Facter.add('github_token') do
  setcode do
    token = ''
    hub = "#{ENV['HOME']}/.config/hub"
    if File.file?(hub)
      token = YAML.load(File.open(hub)).select { |k,v| k == 'github.com'}.values.flatten.select { |c| c['user'] == me }.map { |c| c['oauth_token'] }.first
    end
    token
  end
end
