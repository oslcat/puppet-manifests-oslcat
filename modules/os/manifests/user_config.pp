define os::user_config($home="/home/${title}") {

  case $::operatingsystem {
    /Archlinux/: {
      os::arch::user_config{"$title": home => $home}
    }
  }

  @file { "uc-${title}-dot-config":
    path   => "${home}/.config",
    ensure => directory,
  }
}
