class workstation::role::development::nibz(
){
  #ugly hax +3 karma for obsoletion
  $role = "development"

  include users::nibz
  include zsh

  $pkgs = hiera('pkgs')
  
  util::system_package {[$pkgs]:
    ensure  => latest;
  }
}
