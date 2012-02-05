class firefox {
    package {
        "firefox":
            require => Package[xorg-server],
            ensure  => latest;
        "libpng":
            ensure => latest;
    }
}
