module Spec
  module Example
    class ExampleGroup
      
      def self.describe(name, &implementation)
        # puts "need to describe as a subclass: #{name}"
        # puts implementation
        subclass name, &implementation
      end
      
      # alias_method :context, :describe
      
      def self.it(name, &implementation)
        puts "in IT example definitoon"
        puts implementation
        example_proxy = Spec::Example::ExampleProxy.new name
        example_proxies << example_proxy
        example_implementations[example_proxy] = implementation || pending_implementation
        example_proxy
      end
      
      def self.pending_implementation
        Proc.new do
          raise Spec::Example::NotYetImplementedError
        end
      end
      
      # alias_method :example, :it
      
      # 
      # Creates a subclass for the new describe context
      # 
      def self.subclass(name, &group_block)
        @class_count ||= 0
        @class_count += 1
        
        klass = const_set("Subclass#{@class_count}", Class.new(self))
        klass.description = name
        
        Spec::Example::ExampleGroupFactory.register_example_group klass
        # puts "in subclass"
        # puts group_block
        klass.module_eval &group_block
        klass
      end
      
      # 
      # Set class (subclass) description
      # 
      def self.description= name
        @description = name
        self
      end
      
      def self.example_proxies
        @example_proxies ||= []
      end
      
      def self.example_implementations
        @example_implementations ||= {}
      end
      
      # 
      # Actually run group
      # 
      def self.run(run_options)
        examples = examples_to_run run_options
        notify run_options.reporter
        success = true
        before_all_instance_variables = nil
        run_examples success, before_all_instance_variables, examples, run_options
      end
      
      def self.run_examples(success, instance_variables, examples, run_options)
        examples.each do |example|
          puts "===== Need to run: #{example}"
          # puts "relevant block: #{example_implementations[example]}"
          example_group_instance = new(example, &example_implementations[example])
          example_group_instance.execute run_options, instance_variables
        end
      end
      
      def self.notify reporter
        reporter.example_group_started(Spec::Example::ExampleGroupProxy.new(self))
      end
      
      def self.examples_to_run(run_options)
        example_proxies
      end
      
      # 
      # Instance methods
      #
      def initialize(example_proxy, &implementation)
        @_proxy = example_proxy
        @_implementation = implementation
        # puts "in initialize: #{implementation}"
      end
      
      def execute(run_options, instance_variables)
        run_options.reporter.example_started @_proxy
        execution_error = nil
        
        begin
          puts "running before each"
          # before_each_example
          puts "implementation is: #{@_implementation}"
          puts "===== instance eval begin"
          puts @_implementation
          instance_eval &@_implementation
          puts "===== instance eval end"
        rescue => e
          puts "rescusing error:"
          puts e
          execution_error = e
        end
        
        # puts "found execution error? #{execution_error}"
        run_options.reporter.example_finished @_proxy.update(description), execution_error
      end
    end
  end
end
