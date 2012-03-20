class AiVsHumanServiceListener < TicTacToe::AiVsHumanService::Listener
  attr_reader :events, :input

  def initialize(input)
    @events = []
    @input  = input
    @index  = 0
  end

  def on_render_board(positions)
    @events << { :name      => :on_render_board,
                 :positions => positions.map(&:to_s)
    }
  end

  def on_render_position(mark, number)
    @events << { :name   => :on_render_position,
                 :mark   => mark,
                 :number => number
    }
  end

  def on_get_position
    @events << { :name   => :on_get_position,
                 :number => @input.first
    }
    @input.shift
  end
end

Given /^I will mark position number "([^\"]+)"$/ do |number|
  @position_numbers ||= []
  @position_numbers <<  number
end

When /^the game continuous$/ do
  @service  = TicTacToe::AiVsHumanService.new @board_state
  @listener = AiVsHumanServiceListener.new @position_numbers || []
  @service.add_listener @listener
  @service.call
end

Then /^player "([^\"]+)" should go next$/ do |mark|
  render_positions = @listener.events.map { |e| e[:mark] if e[:name] == :on_render_position }
  @event_index = validate_incrementally(render_positions, mark, @event_index)
end
