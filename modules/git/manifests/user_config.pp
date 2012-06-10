# $title is the name of the user this config should exist for
define git::user_config (
  $home="/home/${title}",
  $template='git/gitconfig.erb'
) {
  @file { "${title}-gitconfig":
    ensure  => present,
    path    => "${home}/.gitconfig",
    tag     => 'git',
    content => template($template),
  }
}
