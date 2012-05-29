class workstation::role::itops::nibz(
){
  #ugly hax +3 karma for obsoletion
  $role = "itops"

  include users::nibz
  include zsh

  $pkgs = hiera('pkgs')
  
  util::system_package {$pkgs:
    ensure  => latest;
  }
}
