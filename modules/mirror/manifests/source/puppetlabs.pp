class mirror::source::puppetlabs{

include apt

  Apt::Source {
    include_src => true,
    key         => "4BD6EC30",
    key_server  => "pgp.mit.edu",
    release     => "${lsbdistcodename}",
    repos       => "main",
  }

  apt::source { "puppetlabs":
    location    => "https://apt.puppetlabs.com",
  }

}
