require 'rubygems'
require 'bundler/setup'

require 'ruby-prof'

dir       = File.expand_path(File.join(File.dirname(__FILE__), 'results'))
file_name = File.basename(__FILE__, '.rb')
time      = Time.now.strftime("%FT%H-%M-%S")
file      = File.join(dir, "#{time}_#{file_name}")

require_relative 'ai_never_loses'

puts "Profiling..."
result = RubyProf.profile do
  TicTacToe::AiNeverLoses.new.call
end

puts "Generating reports..."
File.open "#{file}_flat.txt", 'w' do |f|
  RubyProf::FlatPrinter.new(result).print(f)
end

File.open "#{file}_graph.html", 'w' do |f|
  RubyProf::GraphHtmlPrinter.new(result).print(f)
end

File.open "#{file}_call-stack.html", 'w' do |file|
  RubyProf::CallStackPrinter.new(result).print(file)
end

File.open "#{file}_dot.dot", 'w' do |f|
  RubyProf::DotPrinter.new(result).print(f)
  dot = "dot -Tpng #{f.path} > #{file}_dot.png"
  puts "Generating dot:\n#{dot}\n"
  system dot
end

File.open "#{file}_call-tree.grind", 'w' do |f|
  RubyProf::CallTreePrinter.new(result).print(f)
  grind = "qcachegrind #{f.path}"
  puts "You may open the grind file with:\n#{grind} &\n"
  # system grind
end
