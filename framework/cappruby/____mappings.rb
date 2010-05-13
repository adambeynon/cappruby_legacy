# 
#  mappings.rb
#  cappruby
#  
#  Created by Adam Beynon on 2010-05-13.
#  Copyright 2010 Adam Beynon. All rights reserved.
# 

class Object
    
  # Map a constant name, <tt>name</tt> to the hash table <tt>map</tt> allowing
  # shorter names to be used in the builder
  # 
  # Usage
  # =====
  # 
  # class SomeClass
  # 
  #   constant :size, {
  #     :small  => CPSmallSize,
  #     :medium => CPMediumSize,
  #     :large  => CPLargeSize
  #   }
  # end
  # 
  # @param {Symbol} name
  # @param {Hash} map
  # 
  def self.constant name, map
    `console.log(#{"mapping constant for " + name});`
    define_method `("cappruby_constant_" + name + ':')` do |key|
      
    end
  end
  
  # Map the class to the Object method defined by method_id
  # 
  # Usage
  # =====
  # 
  # class SomeClass
  # 
  #   mapping :some_class, { .. hash ..}
  # end
  # 
  # @param {Symbol} method_id
  # @param {Hash} default_options default options
  # 
  def self.mapping method_id, default_options
    mapped_class = self
    method_name = method_id.to_s + ':'
    Object.define_method(method_name) do |options, &block|
      opts = default_options.merge options
      mapped_class.alloc_with_options opts
    end
  end
  
  # Default behaviour for mappings is to call init_with_options with the options
  # hash. alloc_with_options is initially called with options, plus an optional
  # block which is yield with the receiver as a parameter. Note self within the
  # block is not altered, and maintains definition scope.
  # 
  # @param {Hash} options
  # @param {Proc} block
  # 
  def self.alloc_with_options options, &block
    obj = alloc
    obj.init_with_options options
    # options[':frame'] = CGRectMake 100, 100, 100, 24
    options.each do |key, value|
      # key = `key.substr(1)`
      # setter = `"set" + #{key}[0].toUpperCase() + #{key}.substr(1) + ':'`
      # `objj_msgSend(#{obj}, #{setter}, #{value});`
    end
    # yield obj
    obj
  end
end
