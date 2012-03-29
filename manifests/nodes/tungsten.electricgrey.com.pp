node "tungsten.electricgrey.com" inherits laptop {
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
    include firefox
    include flash
    include terminator

    include conky
    include ncmpcpp
    include lftp

    include users::mythmon
}
