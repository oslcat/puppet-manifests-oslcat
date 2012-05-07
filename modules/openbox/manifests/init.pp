class openbox {
  util::system_package { "openbox":
        ensure => latest,
    }

    File <| tag == "openbox" |>
}

define openbox::user_config($home="/home/${title}") {
    File <| title == "${title}-dot-config" |>

    @file {
        "autostart":
            path     => "${home}/.config/openbox/autostart.sh",
            content  => template('openbox/autostart.sh.erb'),
            tag      => "openbox",
            owner    => "${title}",
            group    => "users",
            ensure   => present;
        "menu":
            path     => "${home}/.config/openbox/menu.xml",
            content  => template('openbox/menu.xml.erb'),
            tag      => "openbox",
            owner    => "${title}",
            group    => "users",
            ensure   => present;
        "rc":
            path     => "${home}/.config/openbox/rc.xml",
            content  => template('openbox/rc.xml.erb'),
            tag      => "openbox",
            owner    => "${title}",
            group    => "users",
            ensure   => present;
    }

    @file { "${title}-openbox":
        ensure => directory,
        path   => "${home}/.config/openbox",
        owner  => "${title}",
        group  => "users", # XXX This should be better.
        tag    => "openbox",
    }
}
