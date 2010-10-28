class Object
  
  def describe str, &block
    # puts "using block:"
    # puts block
    Spec::Example::ExampleGroupFactory.create_example_group str, &block
  end
  
  # alias_method :context, :describe
end
