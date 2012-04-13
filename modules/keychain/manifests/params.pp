class keychain::params {
  $package_askpass = $::operatingsystem ? {
    /Debian/    => "ssh-askpass",
    default     => "ssh-askpass",
  }
}
