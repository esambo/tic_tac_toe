require 'spec_helper'
require 'tic_tac_toe/data/player'
require 'tic_tac_toe/data/board_state'
require 'tic_tac_toe/data/win_position'
require 'tic_tac_toe/roles/winner'
require 'tic_tac_toe/roles/open_ply_finder'
require 'tic_tac_toe/roles/minimax'

module TicTacToe
  describe Minimax do

    let(:board_state) { BoardState.new 3, Player.none, Player.X }
    before :each do
      board_state.extend Winner
      board_state.extend OpenPlyFinder
      board_state.extend Minimax
    end

    describe '#best_position', :include_helpers do

      context "with 'X' in winning position" do
        it 'should find that position number' do
          sequence = '
            1 2 3
            A B _
            _ _ _'.split
          setup_board_state(sequence)
          board_state.last_position_number.should == 3
          best_position = board_state.best_position
          best_position.position_number.should == 3
          best_position.winner.should == Player.X
        end
      end

      context "with 'X' winning in next move" do
        it 'should find that position number' do
          sequence = '
            1 A C
            2 3 _
            B _ _'.split
          setup_board_state(sequence)
          best_position = board_state.best_position
          best_position.position_number.should == 6
          best_position.winner.should == Player.X
        end
      end

      context "with 'X' winning in ply number 7 or 9" do
        it 'should win ASAP' do
          sequence = '
            1 2 B
            A 3 _
            C _ _'.split
          setup_board_state(sequence)
          best_position = board_state.best_position
          best_position.winner.should == Player.X
          best_position.ply_number.should == 7
        end
      end
    end

    describe 'internal' do
      let(:player_X_rank_9)    { WinPosition.new.tap do |p|
          p.position_number = 1
          p.rank            = 9
          p.winner          = Player.X
      end }
      let(:player_O_rank_8)    { WinPosition.new.tap do |p|
          p.position_number = 2
          p.rank            = -8
          p.winner          = Player.O
      end }
      let(:player_draw) { WinPosition.new.tap do |p|
          p.position_number = 4
          p.rank            = 0
          p.winner          = Player.draw
      end }

      describe '#max_for_X' do
        context "with 'O'" do
          let(:final_positions) { [player_O_rank_8] }
          it "should be 'O'" do
            board_state.send(:max_for_X, final_positions).should == player_O_rank_8
          end
        end

        context "with draw and 'O'" do
          let(:final_positions) { [player_O_rank_8, player_draw] }
          it "should be draw" do
            board_state.send(:max_for_X, final_positions).should == player_draw
          end
        end

        context "with draw, 'O' and 'X'" do
          let(:final_positions) { [player_O_rank_8, player_draw, player_X_rank_9] }
          it "should return 'X'" do
            board_state.send(:max_for_X, final_positions).should == player_X_rank_9
          end
        end
      end

      describe '#min_for_O' do
        context "with draw, 'X' and 'O'" do
          let(:final_positions) { [player_O_rank_8, player_draw, player_X_rank_9] }
          it "should return 'O'" do
            board_state.send(:min_for_O, final_positions).should == player_O_rank_8
          end
        end
      end

      describe '#ply_number', :include_helpers do
        context 'with no marks' do
          it 'should be 0' do
            sequence = '
              _ _ _
              _ _ _
              _ _ _'.split
            setup_board_state(sequence)
            board_state.send(:ply_number).should == 0
          end
        end

        context 'with 6 marks' do
          it 'should be 6' do
            sequence = '
              1 2 B
              A 3 _
              C _ _'.split
            setup_board_state(sequence)
            board_state.send(:ply_number).should == 6
          end
        end
      end

      describe '#rank' do
        context "with 'X' winning" do
          let(:winner) { Player.X }

          context 'at depth 9' do
            let(:depth) { 9 }

            it 'should be 1' do
              board_state.send(:rank, winner, depth).should == 1
            end
          end

          context 'at depth 7' do
            let(:depth) { 7 }

            it 'should be 3' do
              board_state.send(:rank, winner, depth).should == 3
            end
          end
        end

        context "with 'O' winning" do
          let(:winner) { Player.O }

          context 'at depth 6' do
            let(:depth) { 6 }

            it 'should be -4' do
              board_state.send(:rank, winner, depth).should == -4
            end
          end
        end

        context 'with draw' do
          let(:winner) { Player.draw }
          let(:depth) { 9 }

          it 'should be 0' do
            board_state.send(:rank, winner, depth).should == 0
          end
        end
      end
    end
  end
end
