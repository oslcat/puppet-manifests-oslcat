class zsh ($system=true) {
  if $system {
    package { "zsh":
      ensure => latest,
    }
  }

  File <| tag == "zsh" |>
}

# config!
define zsh::user_config ($home="/home/${title}", $template="zsh/zshrc.erb") {

  @file {
    "${title}_zsh_dir":
      path   => "${home}/.zsh",
      tag    => "zsh",
      owner  => "${title}",
      group  => "users",
      ensure => directory;
    "${title}-zshrc":
      path    => "${home}/.zshrc",
      content => template("${template}"),
      tag     => "zsh",
      owner   => "${title}",
      group   => "users",
      ensure  => present;
  }
}
