class vim::params {
    $packagename = $::operatingsystem ? {
        /Archlinux/ => "gvim",
        /Linux/     => $::ec2_instance_id ? {
            /.+/    => "vim-enhanced",
            default => "vim",
        },
        default     => "vim",
    }

    $verxorg = package_version('xorg-server')
    $hasxorg = has_package('xorg-server')
    $verherp = package_version('herp')
    $hasherp = has_package('herp')

    notify {"notify-package-version-xorg":
        message => "xorg-version: ${verxorg}",
    }
    notify {"notify-package-has-xorg":
        message => "have xorg: ${hasxorg}",
    }

    notify {"notify-package-version-herp":
        message => "herp-version: ${verherp}",
    }
    notify {"notify-package-has-herp":
        message => "have herp: ${hasherp}",
    }
}
