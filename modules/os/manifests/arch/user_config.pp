define os::arch::user_config($home="/home/${title}") {

  case $::operatingsystem {
    /Archlinux/: {
      @file { "${title}-arch-zshrc":
        ensure  => present;
        path    => "${home}/.zshrc.d/arch",
        tag     => 'zsh',
        owner   => $title,
        group   => 'users',
        content => template('os/arch/zshrc'),
      }
    },
    default: {
    }
  }
}
