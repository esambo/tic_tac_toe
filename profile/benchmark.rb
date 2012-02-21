require 'rubygems'
require 'bundler/setup'

require 'benchmark'

require_relative 'ai_never_loses'

Benchmark.bm do |x|
  x.report do
    TicTacToe::AiNeverLoses.new.call
  end
end
