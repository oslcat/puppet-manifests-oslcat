# $name is the name of the user this config should exist for
define vim::config ($home="/home/${title}") {

    file { "${title}-vimrc":
        path => "${home}/.vimrc",
        ensure => present,
        content => template("vim/vimrc.erb")
    }
}
