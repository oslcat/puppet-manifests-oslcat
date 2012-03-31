class fonts::all {
    include fonts::dina
}

class fonts::dina {
    include fonts::params
    package { "dina":
        name   => "${fonts::params::dina_package}",
        ensure => "${fonts::params::dina_ensure}",
    }
}

class fonts::params {
    $dina_package = "dina-font"
    $dina_ensure = $::operatingsystem ? {
        /Ubuntu/ => 'absent',
        /Fedora/ => 'absent',
        default  => 'latest',
    }
}
