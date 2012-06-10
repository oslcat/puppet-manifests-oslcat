class workstation::role::itops::nibz(
){
  #ugly hax +3 karma for obsoletion
  $role = "itops"

  include users::nibz
  include zsh

  $pkgs = hiera('pkgs')
  $dpkgs = split($pkgs, " ")
  
  util::system_package {$dpkgs:
    ensure  => latest;
  }
}
