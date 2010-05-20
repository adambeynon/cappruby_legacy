# 
#  reporter.rb
#  cappruby
#  
#  Created by Adam Beynon on 2010-05-18.
#  Copyright 2010 Adam Beynon. All rights reserved.
# 

module Spec
  
  module Runner
    
    class Reporter
      
      # attr_reader :options
      def options; @options; end
      
      def initialize options
        @options = options
        @options.reporter = self
        @failures = []
        @pending_count = 0
        @example_count = 0
      end
      
      def example_group_started example_group
        @example_group = example_group
        formatters.each do |f|
          f.example_group_started example_group
        end
      end
      
      def example_started example
        formatters.each do |f|
          f.example_started f
        end
      end
      
      def example_finished example, error
        @example_count += 1
        # puts "example finished"
        if error.nil?
          puts "--- PASSED"
          example_passed example
        elsif Spec::Example::ExamplePendingError === error
          puts "--- PENDING"
          example_pending example, error.message
        else
          puts "--- FAILED"
          puts error
          example_failed example, error
        end
      end
      
      def example_passed example
        formatters.each do |f|
          f.example_passed example
        end
      end
      
      def example_failed example, error
        failure = Failure.new @example_group.description, example.description, error
        @failures << failure
        formatters.each do |f|
          f.example_failed example, @failures.length, failure
        end
      end
      
      def example_pending example, message
        @pending_count += 1
        formatters.each do |f|
          f.example_pending example, message
        end
      end
      
      def start number_of_examples
        @start_time = Time.now
        formatters.each do |f|
          f.start number_of_examples
        end
      end
      
      def end
        @end_time = Time.now
        formatters.each do |f|
          f.end
        end
      end
      
      def dump
        # time_taken = (@end_time - @start_time) / 1000
        time_taken = 0
        puts "Finished in #{time_taken} seconds"
        formatters.each do |f|
          f.dump
        end
      end
      
      def formatters
        @options.formatters
      end
      
      # 
      # Failure class
      # 
      class Failure
        
        # attr_reader :exception
        def expection; @exception; end
        
        def initialize group_description, example_description, exception
          @example_name = "#{group_description} #{example_description}"
          @exception = exception
        end
        
        def header
          if expectation_not_met?
            "#{@example_name} FAILED"
          else
            "#{@exception.class.name} in #{@example_name}"
          end
        end
        
        def expectation_not_met?
          true
        end
        
      end # Failure
      
    end # Reporter
  end
end