class openbox {
  util::system_package { 'openbox':
        ensure => latest,
    }

    File <| tag == 'openbox' |>
}
