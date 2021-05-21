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
    expect(game.player).to be_an_instance_of(Player)
  end

  it 'can start' do
  end

  it 'has a menu' do
  end

  it 'can play a game' do
    game = Game.new

  end

  it 'prints message & records input' do
    game = Game.new

    expect(game.start).to eq()

  end
end
