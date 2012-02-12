require 'data/win_position'

describe WinPosition do
  describe '#new' do
    it 'should have #position_number and #winner' do
      position_number =  1
      winner          = 'X'
      win_position = WinPosition.new
      win_position.position_number = position_number
      win_position.winner          = winner
      win_position.should == WinPosition.new(
        position_number,
        winner
      )
    end
  end
end
