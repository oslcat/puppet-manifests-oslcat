class mirror::source::osuosl {

  include apt

  Apt::Source {
    include_src => true,
    key         => '1EE15D43',
    key_server  => 'pgp.mit.edu',
    release     => $::lsbdistcodename,
    repos       => 'main restricted universe multiverse',
  }

  apt::source {

    'ubuntu.osuosl.deb':
      location      => 'http://ftp.osuosl.org/pub/ubuntu';

    'ubuntu.osuosl.updates.deb':
      location      => 'http://ftp.osuosl.org/pub/ubuntu',
      release       => "${::lsbdistcodename}-updates";

    'ubuntu.osuosl.backports.deb':
      location      => 'http://ftp.osuosl.org/pub/ubuntu',
      release       => "${::lsbdistcodename}-backports";

    'ubuntu.osuosl.security':
      location      => 'http://ftp.osuosl.org/pub/ubuntu',
      release       => "${::lsbdistcodename}-security";
  }
}

