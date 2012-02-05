class firefox {
    package { "firefox":
        require => Package[xorg-server],
        ensure  => present,
    }
}
