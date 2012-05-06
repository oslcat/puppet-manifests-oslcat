class xmonad {
  include xmonad::params

  util::system_package {
    "xmonad-core":
      name   => "${xmonad::params::package_xmonad_core}",
      ensure => latest;
    "xmonad-gnome":
      name   => "${xmonad::params::package_xmonad_gnome}",
      ensure => latest,
  }

  File <| tag == "xmonad" |>
}
