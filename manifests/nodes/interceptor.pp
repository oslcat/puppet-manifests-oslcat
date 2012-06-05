node "interceptor.nibalizer.com" {
  
  stage { 'setup': before => Stage['main'] }

  class {
    'setup':  stage => 'setup';
  }
  
  #tried *very* hard to get multiple users working here, gave up
  #include class multiple times i guess? not too sure if that works or not

  class {'workstation::role::development':
    username => 'nibz',
  }

  class {'workstation::role::itops':
    username => 'nibz',
  }

}
