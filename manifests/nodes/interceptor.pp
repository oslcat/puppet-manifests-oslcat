node "interceptor.nibalizer.com" {
  
  stage { 'setup': before => Stage['main'] }

  class {
    'setup':  stage => 'setup';
  }
  
  class {'workstation::role::development':
    users => ['nibz'],
  }

  class {'workstation::role::itops':
    users => ['nibz'],
  }

}
