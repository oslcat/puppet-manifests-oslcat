class x11 {
    package {
        "xorg-server":       ensure => present;
        "xorg-xinit":        ensure => present;
        "xorg-utils":        ensure => present;
        "xorg-server-utils": ensure => present;

        "mesa":              ensure => present;
        "mesa-demos":        ensure => present;
    }
}

class x11::intel {
    package { "xf86-video-intel":
        ensure => present,
    }
}

class x11::test {
    package {
        "xorg-twm":    ensure => present;
        "xorg-xclock": ensure => present;
        "xterm":       ensure => present;
    }
}
