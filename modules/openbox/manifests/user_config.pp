define openbox::user_config($home="/home/${title}") {
    File <| title == "${title}-dot-config" |>

    @file {
        'autostart':
            ensure   => present,
            path     => "${home}/.config/openbox/autostart.sh",
            content  => template('openbox/autostart.sh.erb'),
            tag      => 'openbox',
            owner    => $title,
            group    => 'users';
        'menu':
            ensure   => present,
            path     => "${home}/.config/openbox/menu.xml",
            content  => template('openbox/menu.xml.erb'),
            tag      => 'openbox',
            owner    => $title,
            group    => 'users';
        'rc':
            ensure   => present,
            path     => "${home}/.config/openbox/rc.xml",
            content  => template('openbox/rc.xml.erb'),
            tag      => 'openbox',
            owner    => $title,
            group    => 'users';
    }

    @file { "${title}-openbox":
        ensure => directory,
        path   => "${home}/.config/openbox",
        owner  => $title,
        group  => 'users', # XXX This should be better.
        tag    => 'openbox',
    }
}
