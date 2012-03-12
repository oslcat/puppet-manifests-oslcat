define util::user_config_file ($app, $user, $path, $template) {
    file { "uc-${app}-${user}":
        ensure  => present,
        path    => "${path}",
        content => template("$template"),
        owner   => "${user}",
        group   => "users", # XXX fix me
    }
}
