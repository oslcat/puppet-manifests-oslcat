define util::system_package(
  $pkg_name=$title,
  $ensure=latest,
  $provider=undef,
  $source=undef
) {
  if $::system {
    package { $title:
      ensure   => $ensure,
      name     => $pkg_name,
      provider => $provider,
      source   => $source,
    }
  }
}
