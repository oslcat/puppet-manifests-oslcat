node core {
  include os
  include puppet
  include puppet::fix_it

  include python
  include ruby
  include vim
  include curl
}

node base inherits core {
  group {
    "users": ensure => present;
    "wheel": ensure => present;
  }

  include git
  include python::dev
  include bc
}

node server inherits base {
}

node gui inherits base {
  include x11
  include fonts::all
}

node laptop inherits gui {
}

node desktop inherits gui {
}
