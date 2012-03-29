class users::uberj {
    $username = "uberj"

    user { "${username}":
        ensure     => present,
        home       => "/home/${username}",
        gid        => "users",
        groups     => ['users', 'wheel'],
        managehome => true,
        shell      => '/bin/bash',
        require    => Package['bash'],
    }

    #os::user_config          { "${username}": }
    bash::user_config         { "${username}": }
    git::user_config         { "${username}": }
    vim::user_config          { "${username}": }
    ruby::dev::user_config   { "${username}": }
    puppet::dev::user_config { "${username}": }
}
