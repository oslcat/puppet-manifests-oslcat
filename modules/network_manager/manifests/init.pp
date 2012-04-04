class network_manager ($ensure="present") {
  include network_manager::params
  package { "network_manager":
    name   => "${network_manager::params::nm_package}",
    ensure => $ensure,
  }
}
