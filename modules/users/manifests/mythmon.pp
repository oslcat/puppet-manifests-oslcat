class users::mythmon ($user=true) {
  $username = 'mythmon'
  $home = '/home/mythmon'

  if $::system {
    user { $username:
      ensure     => present,
      home       => $home,
      gid        => 'users',
      groups     => ['users', 'wheel'],
      managehome => true,
      shell      => '/bin/zsh',
      require    => Package['zsh'],
    }
  }

  if ($::system) or ($::id == $username) {
    file {
      "${username}-tmp":
        ensure => directory,
        path   => "${home}/tmp",
        owner  => $username,
        group  => 'users';
      "${username}-bin":
        ensure => directory,
        path   => "${home}/bin",
        owner  => $username,
        group  => 'users';
    }

    @file {
      "${username}-serve":
        tag     => 'zsh',
        path    => "${home}/.zshrc.d/aliases",
        content => "alias serve='twistd -n web --path .\n'",
        owner   => $username,
        group   => 'users';
    }

    os::user_config        { $username: }
    conky::user_config     { $username: }
    openbox::user_config   { $username: }
    ruby::dev::user_config { $username: }

    vim::user_config { $username:
      template => 'users/mythmon/vimrc.erb',
      pathogen => true,
    }
    vim::solarized { $username: }
    git::user_config { $username:
      template => 'users/mythmon/gitconfig.erb',
    }
    zsh::user_config { $username:
      template => 'users/mythmon/zshrc.erb'
    }


    @file {
      "${username}_zshd":
        ensure => directory;
        path   => "${home}/.zshrc.d",
        tag    => 'zsh',
        owner  => $username,
        group  => 'users',

      "${username}-func":
        ensure  => present;
        path    => "${home}/.zshrc.d/00_func",
        content => template('users/mythmon/zsh/00_func.erb'),
        tag     => 'zsh',
        owner   => $username,
        group   => 'users',
      "${username}-01_hash_color":
        ensure  => present;
        path    => "${home}/.zshrc.d/01_hash_color",
        content => template('users/mythmon/zsh/01_hash_color.erb'),
        tag     => 'zsh',
        owner   => $username,
        group   => 'users',
      "${username}-02_signals":
        ensure  => present;
        path    => "${home}/.zshrc.d/02_signals",
        content => template('users/mythmon/zsh/02_signals.erb'),
        tag     => 'zsh',
        owner   => $username,
        group   => 'users',
      "${username}-10_autoterm":
        ensure  => present;
        path    => "${home}/.zshrc.d/10_autoterm",
        content => template('users/mythmon/zsh/10_autoterm.erb'),
        tag     => 'zsh',
        owner   => $username,
        group   => 'users',
      "${username}-20_auto_ls":
        ensure  => present;
        path    => "${home}/.zshrc.d/20_auto_ls",
        content => template('users/mythmon/zsh/20_auto_ls.erb'),
        tag     => 'zsh',
        owner   => $username,
        group   => 'users',
      "${username}-50_git":
        ensure  => present;
        path    => "${home}/.zshrc.d/50_git",
        content => template('users/mythmon/zsh/50_git.erb'),
        tag     => 'zsh',
        owner   => $username,
        group   => 'users',
      "${username}-51_misc":
        ensure  => present;
        path    => "${home}/.zshrc.d/51_misc",
        content => template('users/mythmon/zsh/51_misc.erb'),
        tag     => 'zsh',
        owner   => $username,
        group   => 'users',
      "${username}-52_ssh":
        ensure  => present;
        path    => "${home}/.zshrc.d/52_ssh",
        content => template('users/mythmon/zsh/52_ssh.erb'),
        tag     => 'zsh',
        owner   => $username,
        group   => 'users',
      "${username}-90_prompt":
        ensure  => present;
        path    => "${home}/.zshrc.d/90_prompt",
        content => template('users/mythmon/zsh/90_prompt.erb'),
        tag     => 'zsh',
        owner   => $username,
        group   => 'users',
    }
  }
}
