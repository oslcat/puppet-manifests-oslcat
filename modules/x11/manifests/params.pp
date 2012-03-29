class x11::params {
  $package_mesa = $::operatingsystem ? {
    /Archlinux/ => "mesa",
    /Ubuntu/    => "mesa-utils",
    default     => "",
  }
  $package_xorg = $::operatingsystem ? {
    /Archlinux/ => "xorg-server",
    /Ubuntu/    => "xserver-xorg",
    /Fedora/    => "xorg-x11-server-Xorg",
  }
  $package_xinit = $::operatingsystem ? {
    /Archlinux/ => "xorg-xinit",
    /Ubuntu/    => "xinit",
    /Fedora/    => "xorg-x11-xinit",
  }
}
