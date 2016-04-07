Facter.add('email') do
  setcode 'git config --global user.email'
end
