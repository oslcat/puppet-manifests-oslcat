class puppet {
  if $::operatingsystem != "Archlinux" {
    package { "puppet":
      ensure => latest,
    }
  }
}
