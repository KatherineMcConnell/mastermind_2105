require 'rspec'
require './lib/player'
require './lib/sequence'
require './lib/compare'
require './lib/messages'
require './lib/game'

game = Game.new.start
#loop for getting userinfo and sending off
user_input = gets.chomp
