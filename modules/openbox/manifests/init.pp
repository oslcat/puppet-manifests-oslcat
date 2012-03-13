class openbox {
    package { "openbox":
        ensure => latest,
    }

    Util::User_config_file <| $app == "openbox" |>
}

define openbox::user_config($home="/home/${title}") {
    File <| title == "${title}-dot-config" |>

    @util::user_config_file {
        "autostart":
            path     => "${home}/.config/openbox/autostart.sh",
            template => 'openbox/autostart.sh.erb',
            app => "openbox",
            user => "${title}";
        "menu":
            path     => "${home}/.config/openbox/menu.xml",
            template => 'openbox/menu.xml.erb',
            app => "openbox",
            user => "${title}";
        "rc":
            path     => "${home}/.config/openbox/rc.xml",
            template => 'openbox/rc.xml.erb',
            app => "openbox",
            user => "${title}";
    }

    file { "${title}-openbox":
        ensure => directory,
        path => "${home}/.config/openbox",
        owner  => "${title}",
        group  => "users", # XXX This should be better.
    }
}
