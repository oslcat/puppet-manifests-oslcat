class setup{
  package {
    "hiera":
      source   => 'http://web.cecs.pdx.edu/~nibz/rubygems',
      provider => gem,
      ensure   => present,
  }
  package {
    "hiera-puppet-nibz":
      source   => 'http://web.cecs.pdx.edu/~nibz/rubygems',
      provider => gem,
      ensure   => present,
  }
}
