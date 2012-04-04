class network_manager {
  include network_manager::params
  package { "network_manager":
    name   => "${network_manager::params::nm_package}",
    ensure => purged,
  }
}
