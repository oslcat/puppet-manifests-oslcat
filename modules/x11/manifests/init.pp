class x11 {
  include x11::params
  Package { ensure => latest, }
  package {
    "${x11::params::package_xorg}":;
    "${x11::params::package_xinit}":;
  }

  if $::operatingsystem =~ /Archlinux/ {
    package {
      "xorg-utils":;
      "xorg-server-utils":;
      "mesa-demos":;
      "${x11::params::package_mesa}":;
    }
  }
  if $::operatingsystem =~ /Ubuntu/ {
    package {
      "${x11::params::package_mesa}":;
    }
  }
}

class x11::intel {
  package { "xf86-video-intel":
    ensure => latest,
  }
}

class x11::synaptics {
  package { "xf86-input-synaptics":
    ensure => latest,
  }
}

class x11::test {
  package {
    "xorg-twm":    ensure => latest;
    "xorg-xclock": ensure => latest;
    "xterm":       ensure => latest;
  }
}

class x11::test::absent {
  package {
    "xorg-twm":    ensure => absent;
    "xorg-xclock": ensure => absent;
    "xterm":       ensure => absent;
  }
}
