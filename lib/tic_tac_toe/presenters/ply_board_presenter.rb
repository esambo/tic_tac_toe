require 'hirb'

module TicTacToe
  module UI
    class PlyBoardPresenter

      def initialize(positions, groups_of_length)
        @positions        = positions
        @groups_of_length = groups_of_length
      end

      def call
        Hirb::Helpers::Table.render(
          as_matrix,
          :description => false,
          :headers => false
        )
      end

        def as_matrix
          @groups_of_length.times.map{ |i|
            @positions[i * @groups_of_length, @groups_of_length]
          }
        end

    end
  end
end
