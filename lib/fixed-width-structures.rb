class FixedWidthStructure

  def self.add_attribute( attribute, type, size, default_value = nil )
    @attributes ||= {}
    @attributes[ attribute.to_sym ] = {
      :type => type,
      :size => size,
      :position => self.size
    }
    increment_size( size )
    if default_value
      define_method attribute do
        value = instance_variable_get( "@#{attribute}" )
        value ? value : default_value
      end
      attr_writer attribute.to_sym
    else
      attr_accessor attribute.to_sym
    end
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

  def self.alphabetic( attribute, length, default_value = '' )
    add_attribute( attribute, "%-#{length}.#{length}s", length, default_value )
  end

  def self.numeric( attribute, length, default_value = 0 )
    add_attribute( attribute, "%#{length}.#{length}d", length, default_value )
  end

  def self.filler( length, character = 'X' )
    alphabetic( "filler_#{size}".to_sym, length, character*length )
  end

  def self.space( length )
    filler( length, ' ' )
  end

  def to_s
    self.class.attributes.to_a.sort{|a,b|a.last[:position]<=>b.last[:position]}.inject('') do |result,current|
      this = current.last[ :type ]%send(current.first)
      result << "%-#{current.last[:size]}.#{current.last[:size]}s"%this
    end
  end

end
