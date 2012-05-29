class mirror::source::puppetlabs{

include apt

  Apt::Source {
    include_src => true,
    key         => "BD6EC30",
    key_server  => "pgp.mit.edu",
    release     => "${lsbdistcodename}",
    repos       => "main",
  }

  apt::source { "puppetlabs":
    location    => "http://apt.puppetlabs.com/ubuntu",
  }

}
