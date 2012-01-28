node "tungsten.electricgrey.com" {
    include vim
    include conky
    include git
    include zsh

    vim::config { "mythmon": }
    conky::config { "mythmon": }
    git::config { "mythmon": }
    zsh::config { "mythmon": }
}
