class os {
    case $::operatingsystem {
        /Archlinux/: {
        }
    }
}

define os::user_config($home="/home/${title}") {
    case $::operatingsystem {
        /Archlinux/: {
            file { "arch-zshrc":
                require => Zsh::User_config[$title],
                path => "${home}/.zshrc.d/arch",
                content => template('os/arch/zshrc'),
            }
        }
    }
}
