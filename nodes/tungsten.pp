node "tungsten.electricgrey.com" {
    file { "/tmp/puppet_was_here":
        ensure => present,
    }

    include vim
#    include zsh
#    include conky
#    include git

    vim::config { "mythmon": }
#    zsh::config { "mythmon": }
#    conky::config { "mythmon": }
#    git::config { "mythmon": }
}
