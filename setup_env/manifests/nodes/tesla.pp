$system = true

node "tesla.nibalizer.com" {

  class { 'setup':
    user => 'nibz'
  }
  class { 'users::bare::nibz': }

}
