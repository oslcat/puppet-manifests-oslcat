class networking::wpa_supplicant($interface='wlan0') {
  include networking::params

  util::system_package {'wpa_supplicant':
    ensure => present,
    name   => $networking::params::wpasupplicant_package,
  }

  if $::operatingsystem == 'Archlinux' {
    file {'init_wpa':
      path    => '/etc/rc.d/wpa',
      mode    => '0755',
      content => template('networking/init_wpa.erb'),
    }
  }
}
