require 'spec_helper'

def draw_grid
  ' 1 2 B
    C A 4
    3 D 5'.split
end

def win_X_grid
  ' 1 A B
    2 _ _
    3 _ _'.split
end

def win_O_grid
  ' A B C
    2 1 _
    3 _ _'.split
end

def string_element_array_to_i(array_of_elements_in_string)
  array_of_elements_in_string.map { |elements_in_string|
    elements_in_string.split.map(&:to_i)
  }
end

def string_element_array_to_player(array_of_elements_in_string)
  array_of_elements_in_string.map { |elements_in_string|
    board_of_marks_to_sequental_players(elements_in_string)
  }
end

def board_of_marks_to_sequental_players(grid_of_string_marks)
  grid_of_string_marks.split.map { |mark| Player.new mark }
end

describe Game do
  let(:game) { Game.new }

  describe '#new' do
    it 'should have a default player X' do
      game.player.should be_X
    end
  end

  describe '#place_mark' do
    it 'should have the #player take turns' do
      game.player.should_receive(:turn)
      game.place_mark 1
    end
  end

  describe '#positions' do
    context 'with no marks' do
      it 'should have 9 empty player spaces' do
        game.positions.should == Array.new(9, Player.none)
      end
    end

    context 'with all marks' do
      it 'should have each mark in the correct space' do
        sequence = '
          1 2 B
          C A 4
          3 D 5'.split
        GridMarkConverter.new.to_sequential_numbers(sequence).each do |space|
          game.place_mark space
        end
        game.positions.should == board_of_marks_to_sequental_players('
          X X O
          O O X
          X O X
        ')
      end
    end
  end

  describe '#winner' do
    context "with 'X' winning" do
      it "should be return 'X'" do
        GridMarkConverter.new.to_sequential_numbers(win_X_grid).each do |space|
          game.place_mark space
        end
        game.winner.should == Player.X
      end

      it "should not be return 'O'" do
        GridMarkConverter.new.to_sequential_numbers(win_X_grid).each do |space|
          game.place_mark space
        end
        game.winner.should_not == Player.O
      end

      it 'should not be a draw' do
        GridMarkConverter.new.to_sequential_numbers(win_X_grid).each do |space|
          game.place_mark space
        end
        game.winner.should_not == Player.draw
      end
    end

    context "with 'O' winning" do
      it "should be return 'O'" do
        GridMarkConverter.new.to_sequential_numbers(win_O_grid).each do |space|
          game.place_mark space
        end
        game.winner.should == Player.O
      end
    end

    context 'with a draw' do
      it 'should be a draw' do
        GridMarkConverter.new.to_sequential_numbers(draw_grid).each do |space|
          game.place_mark space
        end
        game.winner.should == Player.draw
      end
    end
  end

  describe '#valid_ply?' do
    context 'with free space' do
      it 'should be true' do
        game.place_mark 1
        game.should be_valid_ply
      end
    end

    context 'with place mark on already taken space' do
      it 'shuold be false' do
        game.place_mark 1
        game.place_mark 1
        game.should_not be_valid_ply
      end
    end
  end

  context 'internal ' do
    describe '#win_positions' do
      context 'with zero based index' do
        it 'should have 3 rows, 3 cols and 2 diagonals' do
          game.win_positions.should ==
            string_element_array_to_i([
              '0 1 2',
              '3 4 5',
              '6 7 8',

              '0
               3
               6    ',
              '  1
                 4
                 7  ',
              '    2
                   5
                   8',

              '0
                 4
                   8',
              '    2
                 4
               6    ',
          ])
        end
      end
    end

    describe '#marks_to_win_positions' do
      context 'with win' do
        it 'should handle empty marks' do
          sequence = '
            1 A B
            2 _ _
            3 _ _'.split
          GridMarkConverter.new.to_sequential_numbers(sequence).each do |space|
            game.place_mark space
          end
          game.marks_to_win_positions.should ==
            string_element_array_to_player([
              'X O O',
              'X _ _',
              'X _ _',

              'X
               X
               X    ',
              '  O
                 _
                 _  ',
              '    O
                   _
                   _',

              'X
                 _
                   _',
              '    O
                 _
               X    ',
            ])
        end
      end
    end
  end
end
