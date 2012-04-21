module Puppet::Parser::Functions
  # This will only work because we are using only 'puppet apply'.  Functions
  # always run on the puppet master. In our case it happens to be the same as
  # the client, so this works.
  newfunction(:package_version, :type => :rvalue) do |args|
    package_name = args.shift
    Puppet::Resource.indirection.find("package/#{package_name}")[:ensure]
  end
end
