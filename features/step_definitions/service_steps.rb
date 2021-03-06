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

  def on_render_player(mark)
    @events << { :name   => __method__,
                 :mark   => mark }
  end

  def on_render_position(number)
    @events << { :name   => __method__,
                 :number => number }
  end

  def on_render_invalid_position
    @events << { :name   => __method__ }
  end

  def on_render_terminal(player)
    @events << { :name   => __method__,
                 :player => player }
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


Given /^I will mark position number "([^\"]*)"$/ do |number|
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
  render_player = @listener.events.map { |e| e[:mark] if e[:name] == :on_render_player }
  @event_index = validate_incrementally(render_player, mark, @event_index)
end

Then /^the grid should update$/ do
  render_boards = @listener.events.map { |e| 'board' if e[:name] == :on_render_board }
  @event_index = validate_incrementally(render_boards, 'board', @event_index)
end

Then /^the next position number provided should be "([^\"]*)"$/ do |number|
  get_positions = @listener.events.map { |e| e[:number] if e[:name] == :on_get_position }
  @event_index = validate_incrementally(get_positions, number, @event_index)
end

Then /^the position number should be invalid$/ do
  render_invalid_position = @listener.events.map { |e| 'invalid' if e[:name] == :on_render_invalid_position }
  @event_index = validate_incrementally(render_invalid_position, 'invalid', @event_index)
end

Then /^the game should be terminal next$/ do
  render_terminal = @listener.events.map { |e| 'terminal' if e[:name] == :on_render_terminal }
  @event_index = validate_incrementally(render_terminal, 'terminal', @event_index)
end
