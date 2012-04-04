class xmonad::params {
  $package_xmonad_core = $::operatingsystem ? {
    /Fedora/    => "xmonad-core",
    default     => "xmonad-core",
  }
  $package_xmonad_gnome = $::operatingsystem ? {
    /Fedora/    => "xmonad-gnome",
    default     => "xmonad-gnome",
  }
  $package_xmobar = $::operatingsystem ? {
    /Fedora/    => "xmobar",
    default     => "xmobar",
  }
}
