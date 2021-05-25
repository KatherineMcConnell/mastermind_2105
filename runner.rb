require './lib/game'
require './lib/sequence'
require './lib/messages'
require './lib/compare'
require './lib/player'
require 'pry'

sequence = Sequence.new
compare = Compare.new(sequence.random_sequence)
message = Message.new(compare)
game = Game.new(message, message.compare.player)
game.play_game
