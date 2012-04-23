class mythmon_base {
  include lftp
  include ncmpcpp
}

class mythmon_gui inherits mythmon_base {
  include firefox
  include flash
}
