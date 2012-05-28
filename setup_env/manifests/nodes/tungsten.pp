node "tungsten.electricgrey.com" inherits laptop {
  include mythmon_gui

  # System
  include acpi
  include pm
  include networking
  include networking::wifi

  # X
  include x11::intel
  include x11::synaptics

  # Apps
  include openbox
  include dmenu
  include terminator

  include conky

  include users::mythmon
}
