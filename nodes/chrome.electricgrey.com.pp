node "chrome.electricgrey.com" {
    include os

    # System
    include puppet
    include puppet::fix_it

    # GUI Apps
    include firefox

    # CLI Apps
    include vim
    include conky
    include git
    include zsh
    include ncmpcpp
    include lftp

    # Configs
    os::user_config{ "mythmon": }
    zsh::user_config { "mythmon": }
    vim::user_config { "mythmon": }
    conky::user_config { "mythmon": }

    group { "users": ensure => present, }
    group { "wheel": ensure => present, }
    user { "mythmon":
        ensure     => present,
        home       => "/home/mythmon",
        gid        => "users",
        groups     => ['wheel', 'adm', 'dialout', 'cdrom', 'plugdev', 'lpadmin', 'admin', 'sambashare'],
        managehome => true,
        shell      => '/bin/zsh',
        require    => Package['zsh'],
    }
}
