node "ivy" inherits laptop {
    # System
    include ntp
    include networking
    include networking::wifi

    # GUI Apps
    include firefox

    # Users
    include users::simpson
}
