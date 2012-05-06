class network_manager ($ensure="present") {
  include network_manager::params
  util::system_package { "network_manager":
    name   => "${network_manager::params::nm_package}",
    ensure => $ensure,
  }
}
