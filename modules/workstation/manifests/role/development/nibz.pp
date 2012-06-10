class workstation::role::development::nibz(
){
  #ugly hax +3 karma for obsoletion
  $role = "development"

  include users::nibz
  include zsh

  $pkgs = hiera('pkgs')
  $dpkgs = split($pkgs, " ")
  
  util::system_package {[$dpkgs]:
    ensure  => latest;
  }
}
