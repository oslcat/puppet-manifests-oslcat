node 'observatory.cat.pdx.edu'{
  notify{'here_i_am':
    message => 'rockin like a hurricane';
  }
  notify{'ipaddress_is':
    message => "ipaddress => ${::ipaddress}";
  }

}
