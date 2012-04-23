class keychain {
  include keychain::params
  package { "keychain":
    ensure => latest,
  }
  package { "${keychain::params::package_askpass}":
    ensure => latest,
  }
}
