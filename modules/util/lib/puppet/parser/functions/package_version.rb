module Puppet::Parser::Functions
  newfunction(:package_version, :type => :rvalue) do |args|
    package_name = args.shift
    Puppet::Resource.indirection.find("package/#{package_name}")[:ensure]
  end
end
