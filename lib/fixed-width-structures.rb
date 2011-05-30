class FixedWidthStructure

  def self.add_attribute( attribute, type, size )
    @attributes ||= {}
    @attributes[ attribute.to_sym ] = {
      :type => type,
      :size => size,
      :position => self.size
    }
    increment_size( size )
    attr_accessor attribute.to_sym
  end

  def self.attributes
    @attributes ||= {}
  end

  def self.size
    @size ||= 0
  end

  def self.increment_size( increment )
    @size = self.size + increment
  end

  def self.alphabetic( attribute, length )
    add_attribute( attribute, "%-#{length}.#{length}s", length )
    define_method attribute do
      value = instance_variable_get( "@#{attribute}" )
      value ? value : ''
    end
  end

  def self.numeric( attribute, length )
    add_attribute( attribute, "%#{length}.#{length}d", length )
    define_method attribute do
      value = instance_variable_get( "@#{attribute}" )
      value ? value : 0
    end
  end

  def to_s
    self.class.attributes.to_a.sort{|a,b|a.last[:position]<=>b.last[:position]}.inject('') do |result,current|
      this = current.last[ :type ]%send(current.first)
      result << "%-#{current.last[:size]}.#{current.last[:size]}s"%this
    end
  end

end
