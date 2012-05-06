class audio::dev {
  package { "ardour":
    ensure => present,
  }
  package { "audacity":
    ensure => present,
  }
}
