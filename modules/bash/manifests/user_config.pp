define bash::user_config (
  $home="/home/${title}",
  $template='bash/bashrc.erb'
) {

    @file {
        "${title}-bashrc":
            ensure  => present,
            path    => "${home}/.bashrc",
            content => template($template),
            tag     => 'bash',
            owner   => $title,
            group   => 'users',
    }
}
