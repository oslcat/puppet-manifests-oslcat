node "tungsten.electricgrey.com" {
    include os

    # System
    include acpi
    include pm
    include networking
    include networking::wifi
    include puppet
    include puppet::fix_it

    # X
    include x11
    include x11::intel
    include x11::synaptics
    include x11::test::absent

    # GUI Apps
    include openbox
    include dmenu
    include firefox
    include flash
    include terminator

    # CLI Apps
    include vim
    include conky
    include git
    include zsh
    include ncmpcpp
    include lftp

    # Misc
    include fonts::dina

    # Configs
    os::user_config{ "mythmon": }
    openbox::user_config { "mythmon": }
    vim::user_config { "mythmon": }
    conky::user_config { "mythmon": }
    zsh::user_config { "mythmon": }
    terminator::user_config { "mythmon": }

    group { "users": ensure => present, }
    user { "mythmon":
        ensure     => present,
        home       => "/home/mythmon",
        gid        => "users",
        groups     => ['wheel'],
        managehome => true,
        shell      => '/bin/zsh',
        require    => Package['zsh'],
    }
}
