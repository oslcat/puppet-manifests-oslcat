node "sodium.electricgrey.com" {
    include os

    # System

    # CLI Apps
    include vim
    include git
    include zsh
    include lftp

    # Configs
    zsh::user_config { "mythmon": }
    os::user_config{ "mythmon": }
    vim::user_config { "mythmon": }

    group { "users": ensure => present, }
    user { "mythmon":
        ensure     => present,
        home       => "/home/mythmon",
        gid        => "users",
        groups     => ['wheel', 'users', 'music'],
        managehome => true,
        shell      => '/bin/zsh',
        require    => Package['zsh'],
    }
}
