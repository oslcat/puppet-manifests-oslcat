class bash {
    package { "bash":
        ensure => latest,
    }
    File <| tag == "bash" |>
}

define bash::user_config ($home="/home/${title}") {

    @file {
        "${title}-bashrc":
            path    => "${home}/.bashrc",
            content => template("bash/bashrc.erb"),
            ensure  => present,
            tag     => "bash",
            owner   => "${title}",
            group   => "users",
    }
}
