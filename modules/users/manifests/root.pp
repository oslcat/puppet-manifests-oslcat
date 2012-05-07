class users::root {
    $username = "root"

    if $::system {
      user { "${username}":
          ensure     => present,
          home       => "/${username}",
          gid        => "root",
          groups     => ['root'],
      }
    }

    if ($::system) or ($id == $username) {
      os::user_config { "${username}": }
      vim::user_config { "${username}": }
      ruby::dev::user_config { "${username}": }
    }
}
