require './lib/player'
require './lib/messages'

require './lib/game'

RSpec.describe Game do
  it 'exists' do
    game = Game.new

    expect(game).to be_an_instance_of(Game)
  end

  it 'has attributes' do
    game = Game.new

    expect(game.guess_count).to eq(0)
    expect(game.message.player).to be_an_instance_of(Player)
  end

  it 'can start' do
    game = Game.new


    expect(game.start).to eq(game.message.welcome_message)
  end

  it 'has a menu with choices' do
    game = Game.new

    game.player.user_input = 'q'

    expect(game.start_menu).to eq(game.message.exit)

    game.player.user_input = 'i'

    expect(game.start_menu).to eq(game.start)

    game.player.user_input = 'p'

    expect(game.start_menu).to eq(game.message.beginner_sequence)

    game.player.user_input = 'ilsufoiau'

    expect(game.start_menu).to eq(game.message.invalid_input)

  end

  xit 'can play a game' do
    game = Game.new

  end

  xit 'prints message & records input' do
    game = Game.new

    expect(game.start).to eq()

  end
end
