require 'digest/md5'

Facter.add('gravatar') do
  setcode do
    hash = Digest::MD5.hexdigest(Facter.value(:email).downcase)
    "http://www.gravatar.com/avatar/#{hash}.png?s=300"
  end
end
