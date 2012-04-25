class zsh ($system=true) {
  if $system {
    package { "zsh":
      ensure => latest,
    }
  }

  File <| tag == "zsh" |>
}
