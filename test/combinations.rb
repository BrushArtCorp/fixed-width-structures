require 'fixed-width-structures'

describe 'Combinations' do

  before do
    @my_class = Class.new( FixedWidthStructure )
  end

  it 'should combine the whole lot' do
    @my_class.alphabetic( :name, 10 )
    @my_class.alphabetic( :surname, 15 )
    @my_class.filler( 1, ':' )
    @my_class.numeric( :age, 3 )
    @my_class.numeric( :account_number, 11 )
    @my_class.filler( 3 )
    @my_class.alphabetic( :gender, 1, '-' )
    @my_class.numeric( :date, 8 )
    @my_class.space( 7 )

    clive = @my_class.new
    clive.name = "Clive"
    clive.surname = "Crous"
    clive.age = 36
    clive.account_number = 12345678901
    clive.gender = 'M'
    clive.date = 20110213

    clive.to_s.should == 'Clive     Crous          :03612345678901XXXM20110213       '

    bob = @my_class.new
    bob.name = "Bobamalithoniasyner"
    bob.age = 13
    bob.surname = "Yes"

    bob.to_s.should == 'BobamalithYes            :01300000000000XXX-00000000       '

    mary = @my_class.new
    mary.age = 12345

    mary.to_s.should == '                         :12300000000000XXX-00000000       '
    
  end

end

