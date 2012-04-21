module Puppet::Parser::Functions
  # This will only work because we are using only 'puppet apply'.  Functions
  # always run on the puppet master. In our case it happens to be the same as
  # the client, so this works.
  newfunction(:has_package, :type => :rvalue) do |args|
    name = args.shift
    e = Puppet::Resource.indirection.find("package/#{name}")[:ensure]
    e != :purged
  end
end
