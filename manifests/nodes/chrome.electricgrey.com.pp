node "chrome.electricgrey.com" inherits laptop {
    # System
    include ntp

    # GUI Apps
    include firefox

    # CLI Apps
    include conky
    include ncmpcpp
    include lftp

    User["mythmon"] {
        groups     => ['wheel', 'adm', 'dialout', 'cdrom', 'plugdev', 'lpadmin', 'admin', 'sambashare'],
    }
}
