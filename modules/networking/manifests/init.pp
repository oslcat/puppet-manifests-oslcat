class networking {
    file {"init_dhcpcd":
        path    => "/etc/rc.d/dhcpcd",
        mode    => 755,
        content => template('networking/init_dhcpcd.erb'),
    }
}

class networking::wifi($interface="wlan0") {
    package {"wpa_supplicant":
        ensure => latest,
    }
    file {"init_wpa":
        path    => "/etc/rc.d/wpa",
        mode    => 755,
        content => template('networking/init_wpa.erb'),
    }
}
