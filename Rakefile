# Most of this taken from Tim Sharpe's blog
# http://bombasticmonkey.com/
require 'rake'
require 'rake/tasklib'
require 'puppet-lint'
require 'puppet-lint/tasks/puppet-lint'

class OSLCATLint < ::Rake::TaskLib
  # There is a bunch of embarrasment in the manifests directory, so ignore it.
  def initialize(*args)
    desc 'Run puppet-lint for OSLCAT'

    task :oslcat_lint do
      RakeFileUtils.send(:verbose, true) do
        linter =  PuppetLint.new
        Dir.chdir('modules') do
          Dir.glob('**/*.pp').each do |puppet_file|
            puts "Evaluating #{puppet_file}"
            linter.file = puppet_file
            linter.run
          end
        end
        fail if linter.errors?
      end
    end
  end
end

OSLCATLint.new

task :default => [:oslcat_lint]
