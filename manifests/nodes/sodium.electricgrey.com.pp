node "sodium.electricgrey.com" inherits server {
    # CLI Apps
    include lftp

    include users::mythmon
    group { "users": ensure => present, }
    User <| $title == "mythmon" |> {
        groups     +> ['music'],
    }
}
