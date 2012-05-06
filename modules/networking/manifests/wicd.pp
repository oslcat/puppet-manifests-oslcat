class networking::wicd {
  util::system_package { "wicd":
    ensure => present,
  }
}
