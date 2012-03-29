node "chrome.electricgrey.com" inherits laptop {
    # System
    include ntp
    include networking
    include networking::wifi

    # GUI Apps
    include firefox

    # CLI Apps
    include ncmpcpp
    include lftp

    include users::mythmon
    #User["mythmon"] {
    #    groups     => ['wheel', 'adm', 'dialout', 'cdrom', 'plugdev', 'lpadmin', 'admin', 'sambashare'],
    #}
}
