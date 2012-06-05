node 'observatory.cat.pdx.edu'{
  
  stage { 'setup': before => Stage['main'] }

  class {
    'setup':  stage => 'setup';
  }

  class {'server::role::bastion':
    access => ['nibz'],
  }

  class {'server::role::hypervisor':
    hypervisor => ['kvm', 'LXC'],
  }

  class {'switch::role::default':
    switching => ['OpenVswitch'],
  }

}


