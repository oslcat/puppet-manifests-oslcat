class workstation::role::itops(
  $user = undef, 
){
  class { "workstation::role::itops::$user":
    username => $user,
  }
}
