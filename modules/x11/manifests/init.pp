class x11 {
    package {
        "xorg-server":       ensure => latest;
        "xorg-xinit":        ensure => latest;
        "xorg-utils":        ensure => latest;
        "xorg-server-utils": ensure => latest;

        "mesa":              ensure => latest;
        "mesa-demos":        ensure => latest;
    }
}

class x11::intel {
    package { "xf86-video-intel":
        ensure => latest,
    }
}

class x11::synaptics {
    package { "xf86-input-synaptics":
        ensure => latest,
    }
}

class x11::test {
    package {
        "xorg-twm":    ensure => latest;
        "xorg-xclock": ensure => latest;
        "xterm":       ensure => latest;
    }
}

class x11::test::absent {
    package {
        "xorg-twm":    ensure => absent;
        "xorg-xclock": ensure => absent;
        "xterm":       ensure => absent;
    }
}
