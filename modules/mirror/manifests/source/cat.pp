class mirror::source::cat {

include apt

  Apt::Source {
    include_src => true,
    key         => "437d05b5",
    key_server  => "pgp.mit.edu",
    release     => "${lsbdistcodename}",
    repos       => "main restricted universe multiverse",
  }

  apt::source { "ubuntu_mirror_cat":
    location    => "http://mirrors.cat.pdx.edu/ubuntu",
  }

  apt::source { "ubuntu_mirror_cat_updates":
    location    => "http://mirrors.cat.pdx.edu/ubuntu",
    release     => "${lsbdistcodename}-updates",
  }

  apt::source { "ubuntu_mirror_cat_backports":
    location    => "http://mirrors.cat.pdx.edu/ubuntu",
    release     => "${lsbdistcodename}-backports",
  }

  apt::source { "ubuntu_mirror_cat_security":
    location    => "http://mirrors.cat.pdx.edu/ubuntu",
    release     => "${lsbdistcodename}-security",
  }

  apt::source { "ubuntu_partner":
    location    => "http://archive.canonical.com/ubuntu",
    repos       => "partner",
  }
}
