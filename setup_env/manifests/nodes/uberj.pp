node "uberj.nws.oregonstate.edu" inherits laptop {
  include users::uberj_work
  include bash
  include wget
  include htop
  include strace
  include xmonad
  include xmonad::xmobar
  include xscreensaver
  include keychain

  class { "network_manager":
    ensure => "present",
  }
}
