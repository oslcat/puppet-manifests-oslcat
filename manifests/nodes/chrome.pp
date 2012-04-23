node "chrome.electricgrey.com" inherits laptop {
  include mythmon_gui

  # System
  include ntp
  include networking
  include networking::wpa_supplicant

  include users::mythmon
}
