class vim {
  include vim::params

  package { "vim":
    ensure => present,
    name   => "${vim::params::packagename}",
  }

  Util::User_config_file <| app == "vim" |>
  Util::User_config_dir <| app == "vim" |>
}
