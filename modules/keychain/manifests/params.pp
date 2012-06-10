class keychain::params {
  $package_askpass = $::operatingsystem ? {
    default     => 'ssh-askpass',
  }
}
