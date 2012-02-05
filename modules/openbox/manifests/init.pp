class openbox {
    package { "openbox":
        ensure => latest,
    }
}

define openbox::user_config($home="/home/${title}") {
    File <| title == "${title}-dot-config" |>
    file {
        "${title}-openbox":
            path => "${home}/.config/openbox",
            ensure => directory;
        "${title}-openbox-autostart":
            ensure => present,
            path => "${home}/.config/openbox/autostart.sh",
            content => template('openbox/autostart.sh.erb');
        "${title}-openbox-menu":
            ensure => present,
            path => "${home}/.config/openbox/menu.xml",
            content => template('openbox/menu.xml.erb');
        "${title}-openbox-rc":
            ensure => present,
            path => "${home}/.config/openbox/rc.xml",
            content => template('openbox/rc.xml.erb');
    }
}
