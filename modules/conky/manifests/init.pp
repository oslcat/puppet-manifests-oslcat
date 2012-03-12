class conky {
    package { "conky":
        ensure => latest,
    }

    Util::User_config_file <| $app == "conky" |>
}

# $name is the name of the user this config should exist for
define conky::user_config ($home="/home/${title}") {

    util::user_config_file { "conkyrc":
        app      => "conky",
        user     => "${title}",
        path     => "${home}/.conkyrc",
        template => "conky/conkyrc.erb"
    }
}
