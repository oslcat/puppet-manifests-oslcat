class awesome {
  yumrepo { "awesome":
    name     => "fedora-awesome",
    baseurl  => "http://repos.fedorapeople.org/repos/thm/awesome/fedora-\$releasever/\$basearch/",
    enabled  => 1,
    gpgcheck => 0,
  }
  package { "awesome":
    ensure  => present,
    require => Yumrepo["awesome"],
  }
}
