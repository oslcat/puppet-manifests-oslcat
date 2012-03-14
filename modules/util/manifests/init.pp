define util::user_config_file ($app, $user, $path, $template, $ensure='present') {
    file { "ucf-${app}-${user}-${title}":
        ensure  => "${ensure}",
        path    => "${path}",
        content => try_templates($template),
        owner   => "${user}",
        group   => "users", # XXX fix me
    }
}

define util::user_config_dir ($app, $user, $path, $ensure='directory') {
    file { "ucd-${app}-${user}-${title}":
        ensure => "${ensure}",
        path   => "${path}",
        owner  => "${user}",
        group  => "users", # XXX fix me
    }
}
