me = Facter.value(:id)
candidates = [
  "#{ENV['HOME']}/.ssh",
  "/Volumes/#{me}",
  '/Volumes/Install OS X El Capitan',
  '/Volumes/Install OS X Yosemite',
  '/Volumes/Install OS X Mavericks'
]

Facter.add('ssh_key') do
  setcode do
    candidates.map { |d| "#{d}/#{me}" }.find { |f| File.file?(f) }
  end
end
