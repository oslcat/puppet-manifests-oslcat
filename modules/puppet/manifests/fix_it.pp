class puppet::fix_it {
  case $::operatingsystem {
    /Archlinux/: {
      #FIXME
      #This should be fixed by the confine.rb in lib/puppet/provider
      #I am really not sure why it isn't
      file { 'puppet-confine-os-stub':
        path => '/usr/lib/ruby/site_ruby/1.9.1/puppet/provider/confine/operatingsystem.rb',
        content => '',
      }
    }

    /Ubuntu/: {
      $buggy_group_file = '/usr/lib/ruby/1.8/puppet/type/group.rb'
      exec { "fix-buggy-group-type":
        command => "/bin/sed -i -e '/defaultto \"compat\"/d' ${buggy_group_file}",
        onlyif  => "/bin/grep 'defaultto \"compat\"' ${buggy_group_file}",
      }
    }
  }
}
