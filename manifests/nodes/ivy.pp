node "ivy" inherits laptop {
    # System
    include ntp
    include networking
    include networking::wicd

    # CLI Apps
    include bash

    # GUI Apps
    include awesome
    include firefox
    include sakura

    # Users
    include users::simpson
}
