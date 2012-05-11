# config!
define zsh::user_config (
  $home="/home/${title}",
  $template='zsh/zshrc.erb'
) {
  @file {
    "${title}_zsh_dir":
      ensure => directory;
      path   => "${home}/.zsh",
      tag    => 'zsh',
      owner  => $title,
      group  => 'users',
    "${title}-zshrc":
      ensure  => present;
      path    => "${home}/.zshrc",
      content => template($template),
      tag     => 'zsh',
      owner   => $title,
      group   => 'users',
  }
}
