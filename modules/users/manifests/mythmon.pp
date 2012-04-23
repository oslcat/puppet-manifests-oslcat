class users::mythmon ($user=true) {
  $username = "mythmon"
  $home = "/home/mythmon"

  if $user {
    user { "${username}":
      ensure     => present,
      home       => "/home/${username}",
      gid        => "users",
      groups     => ['users', 'wheel'],
      managehome => true,
      shell      => '/bin/zsh',
      require    => Package['zsh'],
    }
  }

  file {
    "${username}-tmp":
      path => "/home/${username}/tmp",
      ensure => directory,
      owner => "${username}",
      group => "users";
    "${username}-bin":
      path => "/home/${username}/bin",
      ensure => directory,
      owner => "${username}",
      group => "users";
  }

  os::user_config        { "${username}": }
  conky::user_config     { "${username}": }
  openbox::user_config   { "${username}": }
  ruby::dev::user_config { "${username}": }

  vim::user_config { "${username}":
    template => "users/mythmon/vimrc.erb",
    pathogen => true,
  }
  git::user_config { "${username}":
    template => "users/mythmon/gitconfig.erb",
  }
  zsh::user_config { "${username}":
    template => "users/mythmon/zshrc.erb"
  }


  @file {
    "${username}_zshd":
      path   => "${home}/.zshrc.d",
      tag    => "zsh",
      owner  => "${username}",
      group  => "users",
      ensure => directory;

    "${username}-func":
      path    => "${home}/.zshrc.d/00_func",
      content => template("users/mythmon/zsh/00_func.erb"),
      tag     => "zsh",
      owner   => "${username}",
      group   => "users",
      ensure  => present;
    "${username}-01_hash_color":
      path    => "${home}/.zshrc.d/01_hash_color",
      content => template("users/mythmon/zsh/01_hash_color.erb"),
      tag     => "zsh",
      owner   => "${username}",
      group   => "users",
      ensure  => present;
    "${username}-10_autoterm":
      path    => "${home}/.zshrc.d/10_autoterm",
      content => template("users/mythmon/zsh/10_autoterm.erb"),
      tag     => "zsh",
      owner   => "${username}",
      group   => "users",
      ensure  => present;
    "${username}-20_auto_ls":
      path    => "${home}/.zshrc.d/20_auto_ls",
      content => template("users/mythmon/zsh/20_auto_ls.erb"),
      tag     => "zsh",
      owner   => "${username}",
      group   => "users",
      ensure  => present;
    "${username}-50_git":
      path    => "${home}/.zshrc.d/50_git",
      content => template("users/mythmon/zsh/50_git.erb"),
      tag     => "zsh",
      owner   => "${username}",
      group   => "users",
      ensure  => present;
    "${username}-51_misc":
      path    => "${home}/.zshrc.d/51_misc",
      content => template("users/mythmon/zsh/51_misc.erb"),
      tag     => "zsh",
      owner   => "${username}",
      group   => "users",
      ensure  => present;
    "${username}-52_ssh":
      path    => "${home}/.zshrc.d/52_ssh",
      content => template("users/mythmon/zsh/52_ssh.erb"),
      tag     => "zsh",
      owner   => "${username}",
      group   => "users",
      ensure  => present;
    "${username}-90_prompt":
      path    => "${home}/.zshrc.d/90_prompt",
      content => template("users/mythmon/zsh/90_prompt.erb"),
      tag     => "zsh",
      owner   => "${username}",
      group   => "users",
      ensure  => present;
  }
}
