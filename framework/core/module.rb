
# Currently modules do not exist, so cheat and add module methods directly into
# CPObject's meta chain.
# class << CPObject
#   
#   # if Klass.new is called with args
#   def new *args
#     `var r = objj_msgSend(#{self}, 'alloc');
#     return objj_msgSend.apply(r, [r, 'init'].concat(#{args}));`
#   end
#   
#   # Define a method, with the given method_id, with block as its implementation
#   # 
#   # @param {Symbol} method_id
#   # @param {Proc} block
#   def define_method method_id, &block
#     `var block = arguments[arguments.length - 1];
#     return cappruby_define_method(#{self}, #{method_id.to_s}, block);`
#   end
#   
#   def alias_method new_method, old_method
#     `return cappruby_alias(#{self}, #{new_method}._sym, #{old_method}._sym);`
#   end
#   
#   def === instance
#     instance.is_a? self
#   end
#   
#   def attr attributes
#     
#   end
#   
#   def attr_reader *attrbutes
#     # attributes.each do |attribute|
#     #   define_method attribute do
#     #     `return #{self}['#{attribute}'];`
#     #   end
#     # end
#   end
#   
#   def attr_writer *attributes
#     
#   end
#   
#   def attr_accessor *attributes
#     # attr_reader *attributes
#     # attr_writer *attributes
#   end
#   
#   def const_set name, value
#     `return cappruby_const_set(#{self}, #{name}, #{value});`
#   end
#   
#   def module_eval &block
#     `return #{block}(#{self}, "");`
#   end
#   
# end
