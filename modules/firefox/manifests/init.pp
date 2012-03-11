class firefox {
    package { "firefox":
        ensure  => latest;
    }
    if ($operatingsystem == "Arch") {
        package {"libpng":
            ensure => latest;
        }
    }
}

# This won't actually install the file. How can I do that?
#class firefox::pentadactyl {
#    $version = "1.0rc1"
#    $src = "http://dactyl.googlecode.com/files/pentadactyl-${version}.xpi"
#    $dst = "/usr/lib/firefox/extensions/pentadactyl@dactyl.googlecode.com"
#
#    exec { "pentadactyl.xpi":
#        command => "/usr/bin/wget ${src} -O ${dst}",
#        creates => "${dst}",
#    }
#}
#
#Class["firefox"] -> Class["firefox::pentadactly"]
