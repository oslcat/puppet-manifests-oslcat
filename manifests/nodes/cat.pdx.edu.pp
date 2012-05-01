node 'observatory.cat.pdx.edu'{
#  $basic_needs = ['htop', 'git', 'vim', 'iptraf']
#  $best_in_class = ['/home/nibz/sanbox/one', '/home/nibz/sandbox/two']
  $best_in_class  = hiera('best_in_class')
  $basic_needs    = hiera('basic_needs')

  notify{'here_i_am':
    message => 'rockin like a hurricane';
  }

  notify{'ipaddress_is':
    message => "ipaddress => ${::ipaddress}";
  }

  package {$basic_needs:
    ensure  => latest;
  }
  
  file {$best_in_class:
    ensure => present,
    mode   => 0644;
  }

}
