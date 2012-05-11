class puppet::fix_it {
  case $::operatingsystem {
    /Archlinux/: {
      #FIXME
      #This should be fixed by the confine.rb in lib/puppet/provider
      #I am really not sure why it isn't
      $puppet_path='/usr/lib/ruby/site_ruby/1.9.1/puppet'
      file { 'puppet-confine-os-stub':
        path    => "${puppet_path}/provider/confine/operatingsystem.rb",
        content => '',
      }
    }

    /Ubuntu/: {
      $buggy_group_file = '/usr/lib/ruby/1.8/puppet/type/group.rb'
      exec { 'fix-buggy-group-type':
        command => "sed -i -e '/defaultto \"compat\"/d' ${buggy_group_file}",
        onlyif  => "grep 'defaultto \"compat\"' ${buggy_group_file}",
        path    => '/bin',
      }
    }

    default: {}
  }
}
