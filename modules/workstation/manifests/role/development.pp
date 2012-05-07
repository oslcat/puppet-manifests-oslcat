class workstation::role::development(
  user = [],
){
  include "workstation::role::development::$user"
}
