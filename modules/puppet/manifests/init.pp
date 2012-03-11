class puppet {
    if $::operatingsystem != "Archlinux" {
        package { "puppet":
            ensure => latest,
        }
    }
}

class puppet::fix_it {
    case $::operatingsystem {
        /Archlinux/: {
            $broken_ipaddress_fact = '/usr/lib/ruby/site_ruby/1.9.1/facter/ipaddress.rb'

            file { "puppet-confine-os-stub":
                path => "/usr/lib/ruby/site_ruby/1.9.1/puppet/provider/confine/operatingsystem.rb",
                content => "",
            }
            exec { "fix-ipaddress-fact":
                command => "/bin/sed -i -e 's/addr://' ${broken_ipaddress_fact}",
                onlyif  => "/bin/grep 'addr:' ${broken_ipaddress_fact}",
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
