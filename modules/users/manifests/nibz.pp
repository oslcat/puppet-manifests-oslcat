class users::nibz($user=true) {
  include users::bare::nibz

  if ($::system) or ($::id == $username) {
    file {
      "${username}-tmp":
        path   => "${home}/tmp",
        ensure => directory,
        owner  => $username,
        group  => "users";
      "${username}-bin":
        path   => "${home}/bin",
        ensure => directory,
        owner  => $username,
        group  => "users";
    }

    @file {
      "${username}-serve":
        tag     => "zsh",
        path    => "${home}/.zshrc.d/aliases",
        content => "alias serve='twistd -n web --path .\n'",
        owner   => $username,
        group   => "users";
    }

    os::user_config        { $username: }
    conky::user_config     { $username: }
    openbox::user_config   { $username: }
    ruby::dev::user_config { $username: }

    vim::user_config { $username:
      template => "users/nibz/vimrc.erb",
      pathogen => true,
    }
    vim::solarized { $username: }
    git::user_config { $username:
      template => "users/nibz/gitconfig.erb",
    }
    zsh::user_config { $username:
      template => "users/nibz/zshrc.erb"
    }


    @file {
      "${username}_zshd":
        path   => "${home}/.zshrc.d",
        tag    => "zsh",
        owner  => $username,
        group  => "users",
        ensure => directory;

      "${username}-func":
        path    => "${home}/.zshrc.d/00_func",
        content => template("users/$username/zsh/00_func.erb"),
        tag     => "zsh",
        owner   => $username,
        group   => "users",
	require => File["${username}_zshd"],
        ensure  => present;
      "${username}-01_hash_color":
        path    => "${home}/.zshrc.d/01_hash_color",
        content => template("users/$username/zsh/01_hash_color.erb"),
        tag     => "zsh",
        owner   => $username,
        group   => "users",
	require => File["${username}_zshd"],
        ensure  => present;
      "${username}-02_signals":
        path    => "${home}/.zshrc.d/02_signals",
        content => template("users/$username/zsh/02_signals.erb"),
        tag     => "zsh",
        owner   => $username,
        group   => "users",
	require => File["${username}_zshd"],
        ensure  => present;
      "${username}-10_autoterm":
        path    => "${home}/.zshrc.d/10_autoterm",
        content => template("users/$username/zsh/10_autoterm.erb"),
        tag     => "zsh",
        owner   => $username,
        group   => "users",
	require => File["${username}_zshd"],
        ensure  => present;
      "${username}-20_auto_ls":
        path    => "${home}/.zshrc.d/20_auto_ls",
        content => template("users/$username/zsh/20_auto_ls.erb"),
        tag     => "zsh",
        owner   => $username,
        group   => "users",
	require => File["${username}_zshd"],
        ensure  => present;
      "${username}-50_git":
        path    => "${home}/.zshrc.d/50_git",
        content => template("users/$username/zsh/50_git.erb"),
        tag     => "zsh",
        owner   => $username,
        group   => "users",
	require => File["${username}_zshd"],
        ensure  => present;
      "${username}-51_misc":
        path    => "${home}/.zshrc.d/51_misc",
        content => template("users/$username/zsh/51_misc.erb"),
        tag     => "zsh",
        owner   => $username,
        group   => "users",
	require => File["${username}_zshd"],
        ensure  => present;
      "${username}-90_prompt":
        path    => "${home}/.zshrc.d/90_prompt",
        content => template("users/$username/zsh/90_prompt.erb"),
        tag     => "zsh",
        owner   => $username,
        group   => "users",
	require => File["${username}_zshd"],
        ensure  => present;
    }
  }
}
