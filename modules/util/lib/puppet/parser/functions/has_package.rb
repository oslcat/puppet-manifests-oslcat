module Puppet::Parser::Functions
  newfunction(:has_package, :type => :rvalue) do |args|
    name = args.shift
    e = Puppet::Resource.indirection.find("package/#{name}")[:ensure]
    e != :purged
  end
end
