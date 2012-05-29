class workstation::role::development(
  $username = undef,
){
  include "workstation::role::development::$username"
}
