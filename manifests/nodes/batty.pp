node "batty" inherits laptop {
  include users::uberj
  include bash
  include wget
  include htop
  include strace
  include xmonad
  include xmonad::xmobar
}
