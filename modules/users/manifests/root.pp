class users::root {
    $username = "root"

    user { "${username}":
        ensure     => present,
        home       => "/${username}",
        gid        => "root",
        groups     => ['root'],
    }

    os::user_config { "${username}": }
    vim::user_config { "${username}": }
    ruby::dev::user_config { "${username}": }
}
