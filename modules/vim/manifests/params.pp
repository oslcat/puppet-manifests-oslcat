class vim::params {
  $packagename = $::operatingsystem ? {
    /Archlinux/ => has_package('xorg-server') ? {
      true => "gvim",
      default => "vim",
    },
    # EC2's Amazon Linux is weird.
    /Linux/     => $::ec2_instance_id ? {
      /.+/    => "vim-enhanced",
      default => "vim",
    },
    default     => "vim",
  }
}
