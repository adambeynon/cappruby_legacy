# 
#  example_group_runner.rb
#  cappruby
#  
#  Created by Adam Beynon on 2010-05-18.
#  Copyright 2010 Adam Beynon. All rights reserved.
# 

module Spec
  
  module Runner
    
    class ExampleGroupRunner
      
      def initialize options
        @options = options
      end
      
      # load files
      # 
      def load_files files
        puts files
      end
      
      # Do actual run
      # 
      def run
        prepare
        example_groups.each do |group|
          group.run @options
        end
        finish
      end
      
      def example_groups
        @options.example_groups
      end
      
      def prepare
        reporter.start number_of_examples
      end
      
      def finish
        reporter.end
        reporter.dump
      end
      
      def reporter
        @options.reporter
      end
      
      def number_of_examples
        0
      end
    end # ExampleGroupRunner
  end
end