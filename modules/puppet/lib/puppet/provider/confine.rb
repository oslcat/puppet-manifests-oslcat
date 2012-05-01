# This is a patched version of the standard Provider::Confne class that
# shipts with puppet. It changes some error handling on line 19.
# It can be removed when
# http://projects.puppetlabs.com/issues/1457
# is resolved.

# It also doesn't work wtf.

# The class that handles testing whether our providers
# actually work or not.
require 'puppet/util'

class Puppet::Provider::Confine
  def self.test(name)
    unless @tests[name]
      begin
        require "puppet/provider/confine/#{name}"
      rescue LoadError => detail
        unless detail.to_s =~ /such file/i
          warn "Could not load confine test '#{name}': #{detail}"
        end
        # Could not find file
      end
    end
    @tests[name]
  end
end
