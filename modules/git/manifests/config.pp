# $title is the name of the user this config should exist for
define git::config ($home="/home/${title}") {

    file { "${title}-gitconfig":
        path    => "${home}/.gitconfig",
        ensure  => present,
        content => template("git/gitconfig.erb")
    }
}
