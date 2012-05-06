class users::uberj {
  $username = "uberj"

  if $::system {
    user { "${username}":
      ensure     => present,
      home       => "/home/${username}",
      gid        => "users",
      groups     => ['users', 'wheel'],
      managehome => true,
      shell      => '/bin/bash',
      require    => Package['bash'],
    }
  }

  if ($system) or ($id == $username) {
    git::user_config { "${username}":
      template => "users/uberj/gitconfig.erb",
    }
    vim::user_config { "${username}":
      template => "users/uberj/vimrc.erb",
    }

    #os::user_config          { "$ { username}": }
    bash::user_config        { "${username}":
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
    }
    ruby::dev::user_config   { "${username}": }
    puppet::dev::user_config { "${username}": }
  }
}
