class users::mythmon {
    $username = "mythmon"

    user { "${username}":
        ensure     => present,
        home       => "/home/${username}",
        gid        => "users",
        groups     => ['users', 'wheel'],
        managehome => true,
        shell      => '/bin/zsh',
        require    => Package['zsh'],
    }

    os::user_config { "${username}": }
    zsh::user_config { "${username}": }
    vim::user_config { "${username}": }
    conky::user_config { "${username}": }
    openbox::user_config { "${username}": }
    ruby::user_config { "${username}": }
}
