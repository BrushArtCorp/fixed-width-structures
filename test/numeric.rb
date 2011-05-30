require 'fixed-width-structures'

describe 'Numerics' do

  before do
    @numeric_class = Class.new( FixedWidthStructure )
  end

  it 'should increment the position' do
    @numeric_class.size.should == 0
    @numeric_class.numeric( :age, 20 )
    @numeric_class.size.should == 20
    FixedWidthStructure.size.should == 0
  end

  it 'should pad with zeros' do
    @numeric_class.numeric( :age, 10 )
    numeric = @numeric_class.new
    numeric.age = 37
    numeric.to_s.should == "0000000037"
  end

  it 'should cut fields that are too long' do
    @numeric_class.numeric( :age, 2 )
    numeric = @numeric_class.new
    numeric.age = 127
    numeric.to_s.should == "12"
  end

  it "should use zero as it's default" do
    @numeric_class.numeric( :age, 3 )
    @numeric_class.new.age.should == 0
  end

  it "should use an populate it's default when provided" do
    @numeric_class.numeric( :age, 3, 11 )
    numeric = @numeric_class.new
    numeric.age.should == 11
    numeric.to_s.should == '011'
  end
end
