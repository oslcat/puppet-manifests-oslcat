class vim ($system=true) {
  include vim::params

  if $system {
    package { "vim":
      ensure => present,
      name   => "${vim::params::packagename}",
    }
  }

  File <| tag == "vim" |>
}
