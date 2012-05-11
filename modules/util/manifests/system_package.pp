define util::system_package(
  $pkg_name=$title,
  $ensure="latest",
  $provider=undef,
  $source=undef
) {
  if $::system {
    package { $title:
      name     => $pkg_name,
      ensure   => $ensure,
      provider => $provider,
      source   => $source;
    }
  }
}
