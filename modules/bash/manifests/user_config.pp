define bash::user_config (
  $home="/home/${title}",
  $template="bash/bashrc.erb"
) {

    @file {
        "${title}-bashrc":
            path    => "${home}/.bashrc",
            content => template("${template}"),
            ensure  => present,
            tag     => "bash",
            owner   => "${title}",
            group   => "users",
    }
}
