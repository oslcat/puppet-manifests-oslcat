class puppet {
  if $::operatingsystem != "Archlinux" {
    package { "puppet":
      ensure => latest,
    }
  }
}

define puppet::dev::user_config ($home="/home/${title}") {
  @file {
    "puppet-vim-syntax":
      path    => "${home}/.vim/syntax/puppet.vim",
      ensure  => present,
      tag     => "vim",
      owner   => "${title}",
      group   => "users",
      content => template("puppet/puppet.syntax.vim.erb");
    "puppet-vim-ftdetect":
      path    => "${home}/.vim/ftdetect/puppet.vim",
      ensure  => present,
      tag     => "vim",
      owner   => "${title}",
      group   => "users",
      content => template("puppet/puppet.ftdetect.vim.erb");
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
