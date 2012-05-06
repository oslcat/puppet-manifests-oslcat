class post{
  $os_defaults         = hiera('os_defaults')
  $nibz_extensions     = hiera('nibz_extentions')

  notify{'here_i_am':
    message => 'rockin like a hurricane';
  }

  notify{'ipaddress_is':
    message => "ipaddress => ${::ipaddress}";
  }

  util::system_package {[$basic_needs, $nibz_extensions]:
    ensure  => latest;
  }
}
