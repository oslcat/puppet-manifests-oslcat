class setup{
  case $::operatingsystem {
    'Archlinux': {
      util::system_package {
        'hiera':
          source   => 'http://web.cecs.pdx.edu/~nibz/rubygems',
          provider => gem,
          ensure   => present,
      }
      util::system_package {
        'hiera-puppet-nibz':
          source   => 'http://web.cecs.pdx.edu/~nibz/rubygems',
          provider => gem,
          ensure   => present,
      }
      file {
        '/home/nibz/.puppet/hiera.yaml':
          ensure  => present,
          content => template('setup/hiera.yaml.erb'),
      }
    }
    'Ubuntu': {
      util::system_package {
        'rubygems':
          ensure   => present,
      }
      util::system_package {
        'hiera':
          provider => gem,
          ensure   => present,
          require  => Package['rubygems'],
      }
      util::system_package {
        'hiera-puppet':
          provider => gem,
          ensure   => present,
          require  => Package['rubygems'],
      }
      file {
        '/home/nibz/.puppet/hiera.yaml':
          ensure  => present,
          content => template('setup/hiera.yaml.erb'),
      }
    }
  }
}
