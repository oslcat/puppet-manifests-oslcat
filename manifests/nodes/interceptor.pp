node "interceptor.nibalizer.com" {
  
  stage { 'setup': before => Stage['main'] }

  class {
    'setup':  stage => 'setup';
  }
  
  class {'workstation::role::development':
    user => ['nibz'],
  }

  class {'workstation::role::itops':
    user => ['nibz'],
  }

}
