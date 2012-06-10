class vim ($system=true) {
  include vim::params

  if $system {
    util::system_package { 'vim':
      ensure   => present,
      pkg_name => $vim::params::packagename,
    }
  }

  File <| tag == 'vim' |>
}
