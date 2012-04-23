# $title is the name of the user this config should exist for
define git::user_config (
  $home="/home/${title}",
  $template="git/gitconfig.erb"
) {
  @file { "${title}-gitconfig":
    path    => "${home}/.gitconfig",
    tag     => "git",
    ensure  => present,
    content => template("${template}"),
  }
}
