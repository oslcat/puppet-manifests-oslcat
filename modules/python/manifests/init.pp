class python {
  util::system_package {
    "python": ensure => present;
  }
}

class python::dev {
  util::system_package {
    "python-pip": ensure => present;
  }
}
