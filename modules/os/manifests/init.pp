class os {
  case $::operatingsystem {
    /Archlinux/: {
    }
  }
}

define os::user_config($home="/home/${title}") {

  case $::operatingsystem {
    /Archlinux/: {
      @util::user_config_file { "${title}-arch-zshrc":
        app    => "zsh",
        user   => "${title}",
        path   => "${home}/.zshrc.d/arch",
        template => 'os/arch/zshrc';
      }
    }
  }

  @file { "uc-${title}-dot-config":
    path => "${home}/.config",
    ensure => directory,
  }
}
