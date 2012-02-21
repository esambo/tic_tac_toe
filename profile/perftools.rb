require 'rubygems'
require 'bundler/setup'

require 'perftools'

dir       = File.expand_path(File.join(File.dirname(__FILE__), 'results'))
file_name = File.basename(__FILE__, '.rb')
time      = Time.now.strftime("%FT%H-%M-%S")
file      = File.join(dir, "#{time}_#{file_name}")

require_relative 'ai_never_loses'

puts "Sampling..."
PerfTools::CpuProfiler.start(file) do
  TicTacToe::AiNeverLoses.new.call
end

txt = "pprof.rb --text #{file} > #{file}.txt"
pdf = "pprof.rb --pdf #{file} > #{file}.pdf"

puts 'Generating text...'
system txt

puts 'Generating PDF...'
system pdf
