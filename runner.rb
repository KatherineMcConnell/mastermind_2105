require './lib/game'
require './lib/sequence'
require './lib/messages'
require './lib/compare'
require 'pry'

message = Message.new
game = Game.new(message)
game.start
#loop for getting userinfo and sending off
loop do
  chomp_input = gets.chomp.downcase
  #binding.pry
  game.game_flow
  if game.message.compare.is_quit? == true
    break
  end
end
