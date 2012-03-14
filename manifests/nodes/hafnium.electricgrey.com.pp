node "hafnium.electricgrey.com" inherits desktop {
    # GUI Apps
    include dmenu
    #include firefox
    include flash

    # CLI Apps
    include lftp

    # Configs
    User <| title == "mythmon" |> {
        groups +> ['http', 'games', 'video', 'optical', 'vboxusers', 'disk', 'lp', 'storage', 'power'],
    }
}
