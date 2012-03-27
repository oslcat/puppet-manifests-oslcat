class vim {
  include vim::params

  package { "vim":
    ensure => present,
    name   => "${vim::params::packagename}",
  }

  File <| tag == "vim" |>
}
