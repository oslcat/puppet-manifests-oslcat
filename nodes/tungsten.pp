node "tungsten.electricgrey.com" {
    include os

    # System
    include pm
    include puppet
    include puppet::fix_it

    # X
    include x11
    include x11::intel
    include x11::test

    # GUI Apps
    include openbox
    include firefox

    # CLI Apps
    include vim
    include conky
    include git
    include zsh
    include ncmpcpp

    # Configs
    os::user_config{ "mythmon": }
    vim::user_config { "mythmon": }
    conky::user_config { "mythmon": }
    zsh::user_config { "mythmon": }
}
