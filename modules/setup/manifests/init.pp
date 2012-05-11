class setup{
  util::system_package {
    'hiera':
      ensure   => present,
      source   => 'http://web.cecs.pdx.edu/~nibz/rubygems',
      provider => gem;
    'hiera-puppet-nibz':
      ensure   => present,
      source   => 'http://web.cecs.pdx.edu/~nibz/rubygems',
      provider => gem;
    'puppet-lint':
      provider => gem;
  }
  file {
    '/home/nibz/.puppet/hiera.yaml':
      ensure  => present,
      content => template('setup/hiera.yaml.erb'),
  }
}
