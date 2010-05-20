# 
#  options.rb
#  cappruby
#  
#  Created by Adam Beynon on 2010-05-18.
#  Copyright 2010 Adam Beynon. All rights reserved.
# 

module Spec
  
  module Runner
    
    class Options
      
      # attr_reader :example_groups
      def example_groups; @example_groups; end
      
      # attr_accessor :reporter
      def reporter
        @reporter
      end
      
      def reporter= reporter
        @reporter = reporter
      end
      
      def initialize
        @example_groups = []
        @reporter = Reporter.new self
      end
      
      def add_example_group example_group
        # puts "adding example group!"
        @example_groups << example_group
      end
      
      def remove_example_group example_group
        @example_groups.delete example_group
      end
      
      def project_root
        @project_root ||= "example"
      end
      
      def run_examples
        puts "running examples"
        runner = ExampleGroupRunner.new self
        runner.run
      end
      
      def formatters
        @formatters ||= []
      end
      
    end # Options
  end
end
