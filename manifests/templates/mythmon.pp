class mythmon_base {
  include lftp
  include ncmpcpp
  include zsh
}

class mythmon_gui inherits mythmon_base {
  include firefox
  include flash
}
