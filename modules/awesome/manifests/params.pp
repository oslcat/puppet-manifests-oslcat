class awesome::params {
  $dependencies = $::operatingsystem ? {
    /Fedora/ => Yumrepo["awesome"],
    default  => undef,
  }
}
