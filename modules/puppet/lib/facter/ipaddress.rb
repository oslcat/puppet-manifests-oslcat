# This is a patched version of the standard ipaddress fact that
# shipts with puppet. It changes some regex on line 15
# It can be removed when
# http://projects.puppetlabs.com/issues/1346
# is resolved.

Facter.add(:ipaddress) do
  confine :kernel => :linux
  confine :operatingsystem => :Archlinux
  setcode do
    ip = nil
    output = %x{/sbin/ifconfig}

    output.split(/^\S/).each { |str|
      if str =~ /inet ([0-9]+\.[0-9]+\.[0-9]+\.[0-9]+)/
        tmp = $1
        unless tmp =~ /^127\./
          ip = tmp
          break
        end
      end
    }

    ip
  end
end
