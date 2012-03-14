module Puppet::Parser::Functions
  newfunction(:try_templates, :type => :rvalue) do |args|
    templates = [args].flatten
    result = nil
    templates.each do |file|
      begin
        debug "Trying template #{file}"
        wrapper = Puppet::Parser::TemplateWrapper.new(self)
        wrapper.file = file
        result = wrapper.result
      rescue
        # that is ok, we have more to try
        debug "Didn't find template #{file}"
      end
    end

    if result
      result
    else
      raise Puppet::ParseError, "Failed to find any of #{templates.join(', ')}"
    end
  end
end
