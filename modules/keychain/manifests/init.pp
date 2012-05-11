class keychain {
  include keychain::params
  util::system_package {
    'keychain':;
    $keychain::params::package_askpass:;
  }
}
