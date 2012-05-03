# This is a patched version of the standard ipaddress fact that
# shipts with puppet. It changes some regex on line 15
# It can be removed when
# http://projects.puppetlabs.com/issues/1346
# is resolved.

Facter.add(:ipaddress) do
  confine :kernel => :linux
  setcode do
    ip = nil

    if FileTest.exists?('/sbin/ip')
      output = %x{/sbin/ip addr}
    else
      output = %x{/sbin/ifconfig}
    end

    output.split(/^\S/).each { |str|
      if str =~ /\sinet a*d*d*r*:*(\d+\.\d+\.\d+\.\d+)/
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
