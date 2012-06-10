define os::user_config($home="/home/${title}") {

  case $::operatingsystem {
    /Archlinux/: {
      os::arch::user_config{ $title:
        home => $home,
      }
    },
    default: {
    }
  }

  @file { "uc-${title}-dot-config":
    ensure => directory,
    path   => "${home}/.config",
  }
}
