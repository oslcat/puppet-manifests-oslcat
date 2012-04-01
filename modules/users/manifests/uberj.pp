class users::uberj {
  $username = "uberj"

  user { "${username}":
    ensure     => present,
    home       => "/home/${username}",
    gid        => "users",
    groups     => ['users', 'wheel'],
    managehome => true,
    shell      => '/bin/bash',
    require    => Package['bash'],
  }

  git::user_config { "${username}":
    template => "users/uberj/gitconfig.erb",
  }
  vim::user_config { "${username}":
    template => "users/uberj/vimrc.erb",
  }

  #os::user_config          { "$ { username}": }
  bash::user_config        { "$ { username}": }
  ruby::dev::user_config   { "$ { username}": }
  puppet::dev::user_config { "$ { username}": }
}
