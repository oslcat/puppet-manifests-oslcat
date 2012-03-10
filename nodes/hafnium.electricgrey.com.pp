node "hafnium.electricgrey.com" {
    include os

    # System
    include puppet
    include puppet::fix_it

    # X
    include x11

    # GUI Apps
    include dmenu
    #include firefox
    include flash

    # CLI Apps
    include vim
    include git
    include zsh
    include lftp

    # Misc
    include fonts::dina

    # Configs
    zsh::user_config { "mythmon": }
    os::user_config{ "mythmon": }
    vim::user_config { "mythmon": }

    group { "users": ensure => present, }
    user { "mythmon":
        ensure     => present,
        home       => "/home/mythmon",
        gid        => "users",
        groups     => ['wheel', 'http', 'games', 'video', 'optical', 'users', 'vboxusers', 'disk', 'lp', 'storage', 'power'],
        managehome => true,
        shell      => '/bin/zsh',
        require    => Package['zsh'],
    }
}
