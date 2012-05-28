class workstation::role::itops::nibz(
  $username = undef,
){
  include users::nibz
  include zsh

  $pkgs = hiera('pkgs')
  
  util::system_package {$pkgs:
    ensure  => latest;
  }
}
