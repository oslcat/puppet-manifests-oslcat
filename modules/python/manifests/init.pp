class python {
  package {
    "python": ensure => present;
  }
}

class python::dev {
  package {
    "python-pip": ensure => present;
  }
}
