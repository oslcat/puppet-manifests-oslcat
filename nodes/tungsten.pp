node "tungsten.electricgrey.com" {
    file { "/tmp/puppet_was_here":
        ensure => present,
    }

    include vim
    include conky

    vim::config { "mythmon": }
    conky::config { "mythmon": }
}
