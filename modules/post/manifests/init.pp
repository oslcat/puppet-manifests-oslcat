class post{
  $best_in_class  = hiera('best_in_class')
  $basic_needs    = hiera('basic_needs')

  notify{'here_i_am':
    message => 'rockin like a hurricane';
  }

  notify{'ipaddress_is':
    message => "ipaddress => ${::ipaddress}";
  }

  util::system_package {$basic_needs:
    ensure  => latest;
  }
}
