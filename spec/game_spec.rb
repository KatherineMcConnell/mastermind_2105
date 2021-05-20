require './lib/player'
require './lib/messages'

require './lib/game'

RSpec.describe Game do
  it 'exists' do
    game = Game.new

    expect(game).to be_an_instance_of(Game)
  end

  it 'prints message & records input' do
    game = Game.new

    expect(game.start).to eq()

  end
end
