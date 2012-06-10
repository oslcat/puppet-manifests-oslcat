class fonts::dina {
    include fonts::params

    util::system_package { 'dina':
        ensure => $fonts::params::dina_ensure,
        name   => $fonts::params::dina_package,
    }
}
