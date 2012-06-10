class conky {
  util::system_package { 'conky':
        ensure => latest,
    }

    File <| tag == 'conky' |>
}
