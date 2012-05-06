class fonts::all {
    include fonts::dina
    include fonts::inconsolata
}

class fonts::dina {
    include fonts::params
    util::system_package { "dina":
        name   => "${fonts::params::dina_package}",
        ensure => "${fonts::params::dina_ensure}",
    }
}

class fonts::inconsolata {
    include fonts::params
    util::system_package { "${fonts::params::inconsolata_package}":
        ensure => "${fonts::params::inconsolata_ensure}",
    }
}

class fonts::params {
    $dina_package = "dina-font"
    $dina_ensure = $::operatingsystem ? {
        /Ubuntu/ => 'absent',
        /Fedora/ => 'absent',
        default  => 'latest',
    }
    $inconsolata_package = $::operatingsystem ? {
        /Fedora/                  => "levien-inconsolata-fonts",
        /Archlinux|Ubuntu|Debian/ => "ttf-inconsolata",
        default                   => "inconsolata",
    }
    $inconsolata_ensure = "latest"
}
