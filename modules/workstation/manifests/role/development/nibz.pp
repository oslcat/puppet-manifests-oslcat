class workstation::role::development::nibz{
  include users::nibz
  notify {
    'hai':
       message => 'hola',
  }
}
