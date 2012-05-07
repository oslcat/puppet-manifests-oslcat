class x11 {
  include x11::params

  if $system {
    util::system_package {
      "${x11::params::package_xorg}":;
      "${x11::params::package_xinit}":;
    }

    if $::operatingsystem =~ /Archlinux/ {
      util::system_package {
        "xorg-utils":;
        "xorg-server-utils":;
        "mesa-demos":;
        "${x11::params::package_mesa}":;
      }
    }
    if $::operatingsystem =~ /Ubuntu/ {
      util::system_package {
        "${x11::params::package_mesa}":;
      }
    }
  }
}

class x11::intel {
  if $system {
    util::system_package { "xf86-video-intel":
      ensure => latest,
    }
  }
}

class x11::synaptics {
  if $system {
    util::system_package { "xf86-input-synaptics":
      ensure => latest,
    }
  }
}

class x11::test($ensure="latest") {
  if $system {
    util::system_package {
      "xorg-twm":    ensure => $ensure;
      "xorg-xclock": ensure => $ensure;
      "xterm":       ensure => $ensure;
    }
  }
}
