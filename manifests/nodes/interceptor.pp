node "interceptor.nibalizer.com" {
  
  #tried *very* hard to get multiple users working here, gave up
  #include class multiple times i guess? not too sure if that works or not

  class {'workstation::role::development':
    username => 'nibz',
  }

  class {'workstation::role::itops':
    username => 'nibz',
  }

}
