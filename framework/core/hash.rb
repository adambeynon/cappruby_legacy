# 
#  hash.rb
#  cappruby
#  
#  Created by Adam Beynon on 2010-05-12.
#  Copyright 2010 Adam Beynon. All rights reserved.
# 

class Hash
  
  def []= key, value
    setObject value, forKey:key
    value
  end
  
  def [] key
    objectForKey key
  end
  
  def each &block
    `var i = 0, keys = #{self}._keys, values = #{self}._buckets;
    for (var i = 0; i < keys.length; i++) {
      #{yield `keys[i]`, `values[keys[i]]`};
    }
    return #{self};
    `
  end
  
  # alias_method :each_pair, :each
  
  def each_key &block
    `var i = 0, keys = #{self}._keys;
    for (var i = 0; i < keys.length; i++) {
      #{yield `keys[i]`};
    }
    return #{self};
    `
  end

  def each_value &block
    `var i = 0, keys = #{self}._keys, values = #{self}._buckets;
    for (var i = 0; i < keys.length; i++) {
      #{yield `values[keys[i]]`};
    }
    return #{self};
    `
  end
  
  def merge options
    result = Hash.dictionaryWithDictionary self
    result.addEntriesFromDictionary options
    result
  end
  
  def empty?
    `return #{self}._keys.length == 0;`
  end
  
  def size
    count
  end
  
  # alias_method :length, :size
  
  def include? member
    containsKey member
  end
  
  # alias_method :member?, :include?
  # alias_method :has_key?, :include?
  # alias_method :key?, :include?
  
  def delete key
    value = `#{self}._buckets[#{key}]`
    removeObjectForKey key
    value
  end
  
  def == other
    isEqual other
  end
end
