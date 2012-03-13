class x11::params {
    $package_mesa = $::operatingsystem ? {
        /Archlinux/ => "mesa",
        /Ubuntu/    => "mesa-utils",
    }
    $package_xorg = $::operatingsystem ? {
        /Archlinux/ => "xorg-server",
        /Ubuntu/    => "xserver-xorg",
    }
    $package_xinit = $::operatingsystem ? {
        /Archlinux/ => "xorg-xinit",
        /Ubuntu/    => "xinit",
    }
}
