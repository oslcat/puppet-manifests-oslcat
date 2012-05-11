class fonts::inconsolata {
    include fonts::params

    util::system_package { $fonts::params::inconsolata_package:
        ensure => $fonts::params::inconsolata_ensure,
    }
}
