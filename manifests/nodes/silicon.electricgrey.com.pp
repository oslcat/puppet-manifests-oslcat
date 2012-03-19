node "silicon.electricgrey.com" inherits server {
    # CLI Apps
    include lftp

    User <| $title == "mythmon" |> {
        groups     +> ['music'],
    }
}
