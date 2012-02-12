module TicTacToe
  class BoardMarkConverter

    def to_alternating_sequence_numbers(grid_sequence)
      @size = grid_sequence.size
      result = []
      players_take_turns.each_with_index do |player, i|
        break if i >= grid_sequence.count
        mark = find_next_mark(grid_sequence, player)
        unless mark.nil?
          mark = next_mark_for_player(mark, player)
          result <<                mark  if X?(mark)
          result << position_for_x(mark) if O?(mark)
        end
      end
      result
    end

    private

      def players_take_turns
        x_player.zip(o_player).flatten
      end

        def x_player
          ('1'.."#{@size}").to_a
        end

        def o_player
          ('A'..numbers_to_upcased_chars(@size - 1)).to_a
        end

          def numbers_to_upcased_chars(number_from_0)
            number_from_0.to_s(26).tr('0-9a-p', 'A-Z')
          end

      def find_next_mark(grid, player)
        grid.find_index { |mark| mark == player }
      end

      def next_mark_for_player(mark, player)
        value = x_player[mark] if X? player
        value = o_player[mark] if O? player
        value
      end

      def X? player
        /^\d+$/ === player
      end

      def O? player
        /^\w+$/ === player
      end

      def position_for_x(letter)
        (o_player.find_index{ |o| o == letter } + 1).to_s
      end
  end
end
