class networking {
  if $::operatingsystem == "Archlinux" {
    file { "init_dhcpcd":
      path    => "/etc/rc.d/dhcpcd",
      mode    => 755,
      content => template('networking/init_dhcpcd.erb'),
    }
  }
}
