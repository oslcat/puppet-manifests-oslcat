class workstation::role::development::nibz{
  include users::nibz
  include zsh
  notify {
    'hai':
       message => 'hola',
  }
}
