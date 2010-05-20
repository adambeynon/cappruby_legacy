require './runner/options'
require './runner/reporter'
require './runner/example_group_runner'
# require './runner/formatter/html_formatter'

module Spec
  
  module Runner
    
    # Main entry point to spec. Here we need to load all spec files, and then 
    # run them.
    def self.run
      # require all specs
      puts "running"
      options.run_examples
    end
    
    def self.options
      @options ||= Options.new
    end
    
  end # Runner
end # Spec
