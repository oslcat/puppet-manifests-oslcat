node "carbon.osuosl.org" inherits desktop {
    # GUI Apps
    include dmenu
    #include firefox
    include flash

    # CLI Apps
    include lftp

    include users::mythmon
    User <| $name == "mythmon" |> {
        groups +> ['http', 'games', 'video', 'optical', 'vboxusers', 'libvirt'],
    }
}
