node "iron" inherits laptop {
    # System
    include ntp
    include networking
    include networking::wifi

    # GUI Apps
    include firefox

    # CLI Apps
    include ncmpcpp
    include lftp

    include users::alan
}
