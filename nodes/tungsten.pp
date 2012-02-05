node "tungsten.electricgrey.com" {
    include os

    include puppet
    include puppet::fix_it

    include x11
    include x11::intel
    include x11::test

    include openbox
    include firefox

    include vim
    include conky
    include git
    include zsh

    os::user_config{ "mythmon": }

    vim::user_config { "mythmon": }
    conky::user_config { "mythmon": }
    zsh::user_config { "mythmon": }
}
