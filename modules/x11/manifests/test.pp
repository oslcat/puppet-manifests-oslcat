class x11::test($ensure='latest') {
  if $::system {
    util::system_package {
      'xorg-twm':    ensure => $ensure;
      'xorg-xclock': ensure => $ensure;
      'xterm':       ensure => $ensure;
    }
  }
}
