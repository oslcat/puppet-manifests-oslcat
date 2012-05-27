define util::system_package(
  $ensure="latest",
  $provider=undef,
  $source=undef,
) {
  if $::system {
    package { "${title}":
      ensure   => $ensure,
      provider => $provider,
      source   => $source ;
    }
  }
}
