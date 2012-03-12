class openbox {
    package { "openbox":
        ensure => latest,
    }

    Util::User_config_file <| $app == "openbox" |>
}

define openbox::user_config($home="/home/${title}") {
    File <| title == "${title}-dot-config" |>

    Util::User_config_file {
        app => "openbox",
        user => "${title}"
    }
    @util::user_config_file {
        "autostart":
            path     => "${home}/.config/openbox/autostart.sh",
            template => 'openbox/autostart.sh.erb';
        "menu":
            path     => "${home}/.config/openbox/menu.xml",
            template => 'openbox/menu.xml.erb';
        "rc":
            path     => "${home}/.config/openbox/rc.xml",
            template => 'openbox/rc.xml.erb';
    }

    file { "${title}-openbox":
        ensure => directory,
        path => "${home}/.config/openbox",
        owner  => "${title}",
        group  => "users", # XXX This should be better.
    }
}
