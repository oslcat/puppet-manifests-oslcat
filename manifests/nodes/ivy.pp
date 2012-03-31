node "ivy" inherits laptop {
    # System
    include ntp
    include networking
    include networking::wicd

    # GUI Apps
    include firefox

    # Users
    include users::simpson
}
