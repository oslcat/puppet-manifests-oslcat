class git ($hub=false, $system=true) {
  if $system {
    package { "git":
      ensure => present,
    }

    package { "hub":
      provider => "gem",
      ensure   => $hub ? {
        true  => present,
        false => absent,
      }
    }
  }

  File <| tag == "git" |>
}
