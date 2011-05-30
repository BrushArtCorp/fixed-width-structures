require 'fixed-width-structures'

describe 'Alphabetics' do

  before do
    @alphabetic_class = Class.new( FixedWidthStructure )
  end

  it 'should increment the position' do
    @alphabetic_class.size.should == 0
    @alphabetic_class.alphabetic( :name, 20 )
    @alphabetic_class.size.should == 20
    FixedWidthStructure.size.should == 0
  end

  it 'should pad with space' do
    @alphabetic_class.alphabetic( :name, 10 )
    alphabetic = @alphabetic_class.new
    alphabetic.name = "Clive"
    alphabetic.to_s.should == "Clive     "
  end

  it 'should cut fields that are too long' do
    @alphabetic_class.alphabetic( :name, 3 )
    alphabetic = @alphabetic_class.new
    alphabetic.name = "Clive"
    alphabetic.to_s.should == "Cli"
  end

end
