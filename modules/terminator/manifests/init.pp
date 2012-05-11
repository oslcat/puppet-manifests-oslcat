class terminator {
    util::system_package { 'terminator':
        ensure => present,
    }

    File <| tag == 'terminator' |>
}
