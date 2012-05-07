class zsh () {
  util::system_package { "zsh":
    ensure => latest,
  }

  File <| tag == "zsh" |>
}
