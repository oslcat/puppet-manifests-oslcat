node "harley" inherits laptop {
    # System
    include ntp
    include networking
    include networking::wicd

    # CLI Apps
    include bash
    include keychain
    include midi

    # GUI Apps
    include awesome
    include firefox
    include puzzles
    include sakura

    # Users
    include users::simpson
}
