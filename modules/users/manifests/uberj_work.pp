class users::uberj_work {
  $username = "uberj"
  $home = "/nfs/milo/u1/uberj/"

  user { "${username}":
    ensure     => present,
    home       => "/nfs/milo/u1/${username}",
    gid        => "users",
    groups     => ['users', 'wheel'],
    managehome => true,
    shell      => '/bin/bash',
    require    => Package['bash'],
  }

  git::user_config { "${username}":
    template => "users/uberj/gitconfig.erb",
    home=>$home,
  }
  vim::user_config { "${username}":
    template => "users/uberj/vimrc.erb",
    home=>$home,
  }

  #os::user_config          { "$ { username}": }
  bash::user_config        { "${username}":
    home=>$home,
    template => "users/uberj/bashrc.erb",
  }
  # Give root my config
  bash::user_config        { "root":
    home=>"/root/",
    template => "users/uberj/bashrc.erb",
  }
  xmonad::user_config        { "${username}":
    xmonad_template => "users/uberj/xmonad.erb",
    xmobar_template => "users/uberj/xmobar.erb",
    home=>$home,
  }
  ruby::dev::user_config   { "${username}":
    home=>$home,
  }
  puppet::dev::user_config { "${username}":
    home=>$home,
  }
}
