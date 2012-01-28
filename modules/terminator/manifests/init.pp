class terminator {
    package { "terminator":
        ensure => present,
    }
}

# $title is the name of the user this config should exist for
define terminator::config ($home="/home/${title}") {
    $user = $title
}
