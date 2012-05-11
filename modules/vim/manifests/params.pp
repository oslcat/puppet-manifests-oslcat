class vim::params {
  $packagename = $::operatingsystem ? {
    # On arch, the gvim package turns on the X11 features.
    /Archlinux/ => has_package('xorg-server') ? {
      true      => "gvim",
      default   => "vim",
    },
    # EC2's Amazon Linux is weird.
    /Linux/     => $::ec2_instance_id ? {
      /.+/      => "vim-enhanced",
      default   => "vim",
    },
    /Fedora/    => "vim-enhanced",
    default     => "vim",
  }
}
