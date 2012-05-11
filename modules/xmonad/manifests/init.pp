class xmonad {
  include xmonad::params

  util::system_package {
    'xmonad-core':
      ensure => latest;
      name   => $xmonad::params::package_xmonad_core,
    'xmonad-gnome':
      ensure => latest,
      name   => $xmonad::params::package_xmonad_gnome,
  }

  File <| tag == 'xmonad' |>
}
