class openbox {
    package { "openbox":
        ensure => latest,
    }
}

define openbox::user_config($home="/home/${title}") {
}
