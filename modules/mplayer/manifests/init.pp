# Short helper for providing a yum repo from an RPM.
define package::repo_release ($source) {
  exec { $name:
    command =>"/bin/rpm -Uvh ${source}",
    creates => "/etc/yum.repos.d/${name}.repo",
  }
}

class rpmfusion {
  util::system_package { "rpmfusion-free-release":
    ensure => latest,
    require => Package::Repo_release["rpmfusion-free"],
  }
  package::repo_release { "rpmfusion-free":
    source =>
    "http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-stable.noarch.rpm",
  }
}

class mplayer {
  include rpmfusion

  util::system_package { "mplayer":
    ensure => latest,
    require => Package["rpmfusion-free-release"],
  }
}
