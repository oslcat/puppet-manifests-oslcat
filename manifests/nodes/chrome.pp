node "chrome.electricgrey.com" inherits laptop {
  # System
  include ntp
  include networking
  include networking::wpa_supplicant

  # GUI Apps
  include firefox

  # CLI Apps
  include ncmpcpp
  include lftp

  include users::mythmon
}
