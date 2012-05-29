class workstation::role::itops(
  $username = undef, 
){
  include "workstation::role::itops::$username"
}
