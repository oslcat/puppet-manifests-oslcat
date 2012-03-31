class users::simpson {
    $username = "simpson"

    user { "${username}":
        ensure     => present,
        home       => "/home/${username}",
        gid        => "users",
        groups     => ['users', 'wheel'],
        managehome => true,
        shell      => '/bin/bash',
    }

    vim::user_config         { "${username}": }

    ruby::dev::user_config   { "${username}": }
    puppet::dev::user_config { "${username}": }
}
