class users::simpson ($username="simpson") {
  if $system {
    user { "${username}":
      ensure     => present,
      home       => "/home/${username}",
      gid        => "users",
      groups     => ['users', 'wheel'],
      managehome => true,
      shell      => '/bin/bash',
    }

    include fonts::inconsolata
  }

  if ($::system) or ($id == $username) {
    git::user_config { "${username}":
      template => "users/simpson/gitconfig.erb",
    }

    vim::user_config         { "${username}":
      template => "users/simpson/vimrc.erb",
    }

    ruby::dev::user_config   { "${username}": }
    puppet::dev::user_config { "${username}": }
  }
}
