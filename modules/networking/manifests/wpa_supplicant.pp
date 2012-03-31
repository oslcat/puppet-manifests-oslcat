class networking::wpa_supplicant($interface="wlan0") {
  include networking::params

  package {"wpa_supplicant":
    name   => $networking::params::wpasupplicant_package,
    ensure => present,
  }

  if $operatingsystem == "Archlinux" {
    file {"init_wpa":
      path    => "/etc/rc.d/wpa",
      mode    => 755,
      content => template('networking/init_wpa.erb'),
    }
  }
}
