define util::system_package($ensure="latest", $provider="default") {
  if $::system {
    package { "${title}":
      ensure => $ensure,
      provider => $provider;
    }
  }
}
