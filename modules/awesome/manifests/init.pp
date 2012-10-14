class awesome {
  include awesome::params
  if $::system {
    if $::operatingsystem =~ /Fedora/ {
      yumrepo { "awesome":
        name     => "fedora-awesome",
        descr    => "Fedora - Awesome",
        baseurl  => "http://repos.fedorapeople.org/repos/thm/awesome/fedora-\$releasever/\$basearch/",
        enabled  => 1,
        gpgcheck => 0,
      }
    }
  }
  util::system_package { "awesome":
    ensure  => present,
    require => $awesome::params::dependencies,
  }
  File <| tag == "awesome" |>
}
