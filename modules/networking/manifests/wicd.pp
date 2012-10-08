class networking::wicd {
  util::system_package { "wicd":
    ensure => present,
  }
  util::system_package { "wicd-curses":
    ensure => present,
  }
}
