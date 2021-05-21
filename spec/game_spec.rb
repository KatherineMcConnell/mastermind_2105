require './lib/player'
require './lib/messages'
require './lib/game'

RSpec.describe Game do
  it 'exists' do
    game = Game.new(Message.new('test'))

    expect(game).to be_an_instance_of(Game)
  end

  it 'has attributes' do
    game = Game.new(Message.new('test'))

    expect(game.guess_count).to eq(0)
    expect(game.message).to be_an_instance_of(Message)
  end

  it 'can start' do
    message = Message.new('test')
    game = Game.new(message)

    expect(game.start).to eq(message.welcome_message)
  end

  it 'start menu quits' do
    message = Message.new('q')
    game = Game.new(message)

    expect(game.start_menu).to eq(game.message.exit_message)
  end

  it 'start menu prints instructions' do
    message = Message.new('i')
    game = Game.new(message)

    expect(game.start_menu).to eq(game.start)
  end

  it 'start menu plays' do
    message = Message.new('p')
    game = Game.new(message)

    expect(game.start_menu).to eq(game.message.beginner_sequence_message)
  end

  it 'start menu has invalid inputs' do
    message = Message.new('ilsufoiau')
    game = Game.new(message)

    expect(game.start_menu).to eq(game.message.invalid_input)
  end

  it 'can keep guess count' do
    message = Message.new('gyyb')
    game = Game.new(message)

    game.game_flow
    expect(game.guess_count).to eq(1)
  end

  it 'can end the game' do
    message = Message.new('q')
    game = Game.new(message)

    expect(game.end_game).to eq(game.message.exit_message)
  end


end
