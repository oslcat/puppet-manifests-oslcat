class fonts::all {
    include fonts::dina
}

class fonts::dina {
    package { "dina-font":
        ensure => latest,
    }
}
