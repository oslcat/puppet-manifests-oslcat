class git ($hub=false) {
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

  File <| title == "git" |>
}
