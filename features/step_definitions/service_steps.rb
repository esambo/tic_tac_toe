class AiVsHumanServiceListener
  attr_reader :events, :input

  def initialize(input)
    @events = []
    @input  = input
    @index  = 0
  end

  def on_render_board(positions)
    @events << { :name      => __method__,
                 :positions => positions.map(&:to_s) }
  end

  def on_render_position(mark, number)
    @events << { :name   => __method__,
                 :mark   => mark,
                 :number => number }
  end

  def on_render_invalid_position
    @events << { :name   => __method__ }
  end

  def on_get_position
    @events << { :name   => __method__,
                 :number => @input.first }
    @input.shift
  end
end

def validate_next_event(events, event_name, event_value, find, index)
  index ||= 0
  failure_message = "expected #{index + 1} events\n     got #{events.length} events\nin events: #{events.inspect}\n"
  events.length.should be > index, failure_message
  events[index][:name].should == event_name
  failure_message = "expected event: #{find}\n     got event: #{events[index][event_value]}\nat index: #{index}\nin events: #{events.inspect}\n"
  events[index][event_value].should include(find), failure_message unless find.nil?
  index += 1
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
  # render_positions = @listener.events.map { |e| e[:mark] if e[:name] == :on_render_position }
  # @event_index = validate_incrementally(render_positions, mark, @event_index)
  @event_index = validate_next_event(@listener.events, :on_render_position, :mark, mark, @event_index)
end

Then /^the grid should update$/ do
  # render_boards = @listener.events.map { |e| 'board' if e[:name] == :on_render_board }
  # @event_index = validate_incrementally(render_boards, 'board', @event_index)
  @event_index = validate_next_event(@listener.events, :on_render_board, :positions, 'X', @event_index)
end

Then /^the next position number provided should be "([^\"]+)"$/ do |number|
  # get_positions = @listener.events.map { |e| e[:number] if e[:name] == :on_get_position }
  # @event_index = validate_incrementally(get_positions, number, @event_index)
  @event_index = validate_next_event(@listener.events, :on_get_position, :number, number, @event_index)
end

Then /^the position number should be invalid$/ do
  # render_invalid_position = @listener.events.map { |e| 'invalid' if e[:name] == :on_render_invalid_position }
  # @event_index = validate_incrementally(render_invalid_position, 'invalid', @event_index)
  @event_index = validate_next_event(@listener.events, :on_render_invalid_position, nil, nil, @event_index)
end
