class bash {
    util::system_package { 'bash':
        ensure => latest,
    }
    File <| tag == 'bash' |>
}
