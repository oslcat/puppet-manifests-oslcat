class midi::params {
  $timidity_package = $::operatingsystem ? {
    /Fedora/ => "timidity++",
    default  => "timidity",
  }
}
