class x11::params {
  $package_mesa = $::operatingsystem ? {
    /Archlinux/ => 'mesa',
    /Ubuntu/    => 'mesa-utils',
    /Debian/    => 'mesa-utils',
    default     => '',
  }
  $package_xorg = $::operatingsystem ? {
    /Archlinux/ => 'xorg-server',
    /Ubuntu/    => 'xserver-xorg',
    /Debian/    => 'xserver-xorg',
    /Fedora/    => 'xorg-x11-server-Xorg',
  }
  $package_xinit = $::operatingsystem ? {
    /Archlinux/ => 'xorg-xinit',
    /Ubuntu/    => 'xinit',
    /Debian/    => 'xinit',
    /Fedora/    => 'xorg-x11-xinit',
  }
}
