node "darktemplar" {

  class { 'mirror::source':
    mirror => 'cat',
  }

  include mirror::source::puppetlabs

  include fonts::all
  include vim
  include zsh
}
