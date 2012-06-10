class puppet {
  if $::operatingsystem != 'Archlinux' {
    util::system_package { 'puppet':
      ensure => latest,
    }
  }
}
