class networking::params {
  $wpasupplicant_package = $::operatingsystem ? {
    Archlinux => 'wpa_supplicant',
    default   => 'wpasupplicant',
  }
}
