class bash {
    package { "bash":
        ensure => latest,
    }
    File <| tag == "bash" |>
}
