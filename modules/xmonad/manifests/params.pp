class xmonad::params {
  $package_xmonad_core = $::operatingsystem ? {
    /Debian/    => 'xmonad',
    default     => 'xmonad-core',
  }
  $package_xmonad_gnome = $::operatingsystem ? {
    /Fedora/    => 'xmonad-gnome',
    default     => '',
  }
  $package_xmobar = $::operatingsystem ? {
    default     => 'xmobar',
  }
}
