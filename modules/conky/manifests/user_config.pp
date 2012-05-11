# $name is the name of the user this config should exist for
define conky::user_config ($home="/home/${title}") {

    @file { 'conkyrc':
        ensure  => present,
        path    => "${home}/.conkyrc",
        tag     => 'conky',
        owner   => $title,
        content => template('conky/conkyrc.erb'),
    }
}
