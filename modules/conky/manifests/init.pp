class conky {
    package { "conky":
        ensure => latest,
    }

    File <| tag == "conky" |>
}

# $name is the name of the user this config should exist for
define conky::user_config ($home="/home/${title}") {

    @file { "conkyrc":
        path    => "${home}/.conkyrc",
        tag     => "conky",
        owner   => "${title}",
        content => template("conky/conkyrc.erb"),
        ensure  => present,
    }
}
