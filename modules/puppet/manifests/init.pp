class puppet {
  if $::operatingsystem != "Archlinux" {
    package { "puppet":
      ensure => latest,
    }
  }
}

define puppet::dev::user_config ($home="/home/${title}") {
  @util::user_config_file {
    "puppet-vim-syntax":
      app => "vim",
      user => "${title}",
      path => "${home}/.vim/syntax/puppet.vim",
      template => "puppet/puppet.syntax.vim.erb";
    "puppet-vim-ftdetect":
      app => "vim",
      user => "${title}",
      path => "${home}/.vim/ftdetect/puppet.vim",
      template => "puppet/puppet.ftdetect.vim.erb";
    "puppet-vim-ftplugin":
      app => "vim",
      user => "${title}",
      path => "${home}/.vim/ftplugin/puppet.vim",
      template => "puppet/puppet.ftplugin.vim.erb";
  }
}

class puppet::fix_it {
  case $::operatingsystem {
    /Archlinux/: {
      $broken_ipaddress_fact = '/usr/lib/ruby/site_ruby/1.9.1/facter/ipaddress.rb'
      $broken_collector = '/usr/lib/ruby/site_ruby/1.9.1/puppet/parser/collector.rb'

      file { "puppet-confine-os-stub":
        path => "/usr/lib/ruby/site_ruby/1.9.1/puppet/provider/confine/operatingsystem.rb",
        content => "",
      }
      exec { "fix-ipaddress-fact":
        command => "/bin/sed -i -e 's/addr://' ${broken_ipaddress_fact}",
        onlyif  => "/bin/grep 'addr:' ${broken_ipaddress_fact}",
      }
      exec { "fix-collector":
        command => "/bin/sed -i -e 's/overrides\\[:source\\].meta_def(:child_of?) do\$/overrides[:source].meta_def(:child_of?) do |*_|/' ${broken_collector}",
        onlyif  => "/bin/grep 'overrides\\[:source\\].meta_def(:child_of?) do$' ${broken_collector}",
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
