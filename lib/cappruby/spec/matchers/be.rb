module Spec
  
  module Example
    
    class ExampleGroup
      
      def be_nil
        Matcher.new(:be_nil, nil) do |exp|
          # puts "in here like be_nil"
          self.match do |actual|
            actual.nil?
          end
          # puts "done this bit"
        end
      end
    end
  end
end
