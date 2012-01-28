class SKEL {
    package { "SKEL":
        ensure => present,
    }
}

# $title is the name of the user this config should exist for
define SKEL::config ($home="/home/${title}") {

    $user = $title

    file {
        "${user}-SKELrc":
            path    => "${home}/.SKELrc",
            ensure  => present,
            content => template("SKEL/SKELrc.erb");
    }
}
