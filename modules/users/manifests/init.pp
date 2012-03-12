class users::mythmon {
    user { "mythmon":
        ensure     => present,
        home       => "/home/mythmon",
        gid        => "users",
        groups     => ['users', 'wheel'],
        managehome => true,
        shell      => '/bin/zsh',
        require    => Package['zsh'],
    }

    os::user_config { "mythmon": }
    zsh::user_config { "mythmon": }
    vim::user_config { "mythmon": }
    conky::user_config { "mythmon": }
    openbox::user_config { "mythmon": }
}
