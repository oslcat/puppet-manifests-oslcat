# $name is the name of the user this config should exist for
define conky::config ($home="/home/${title}") {

    file { "${title}-conkyrc":
        path => "${home}/.conkyrc",
        ensure => present,
        content => template("conky/conkyrc.erb")
    }
}
