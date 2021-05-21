require './lib/game'
require './lib/sequence'
require './lib/messages'
require './lib/compare'

game = Game.new.start
#loop for getting userinfo and sending off
loop do
  user_input = gets.chomp.downcase
  game.game_flow
  if game.compare.is_quit? == true
    break
  end
end
