class puppet {
    package { "puppet":
        ensure => installed,
        #provider => "yaourt",
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
    }
}
