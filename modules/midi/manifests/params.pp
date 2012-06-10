class midi::params {
  $timidity_package = $::operatingsystem ? {
    default  => 'timidity',
  }
}
