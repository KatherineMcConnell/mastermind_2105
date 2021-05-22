require './lib/sequence'
require './lib/compare'
require './lib/player'
require 'rspec'

RSpec.describe Compare do

  it 'exists' do
    compare = Compare.new('gggg')

    expect(compare).to be_a(Compare)
  end

  it 'has attributes' do
    compare = Compare.new('gggg')

    expect(compare.sequence).to eq('gggg')
    expect(compare.start_menu_inputs).to eq(['q', 'quit', 'i','instructions', 'p', 'play', 'c', 'cheat'])
    expect(compare.guess_count).to eq(0)
  end

  it 'can find start menu inputs' do
    player = Player.new
    compare = Compare.new('gggg')

    compare.player.user_input = 'quit'

    expect(compare.is_menu_input?).to be true
  end

  it 'can find guess inputs' do
    player = Player.new
    compare = Compare.new('gggg')

    compare.player.user_input = 'bybg'

    expect(compare.is_guess?).to be true
  end

  it 'can determine if guess is too long or short' do
    player = Player.new
    compare = Compare.new('gggg')

    compare.player.user_input = 'bybgb'

    expect(compare.too_long).to be true
    expect(compare.too_long_or_short?).to be true
    expect(compare.too_short).to be false

    compare.player.user_input = 'byb'

    expect(compare.too_long).to be false
    expect(compare.too_long_or_short?).to be true
    expect(compare.too_short).to be true
  end

  it 'can find quit inputs' do
    player = Player.new
    compare = Compare.new('gggg')

    compare.player.user_input = 'q'

    expect(compare.is_quit?).to be true

    compare.player.user_input = 'quit'

    expect(compare.is_quit?).to be true
  end

  it 'can find instruction inputs' do
    player = Player.new
    compare = Compare.new('gggg')

    compare.player.user_input = 'i'

    expect(compare.is_instructions?).to be true

    compare.player.user_input = 'instructions'

    expect(compare.is_instructions?).to be true
  end

  it 'can find play inputs' do
    player = Player.new
    compare = Compare.new('gggg')

    compare.player.user_input = 'p'

    expect(compare.is_play?).to be true

    compare.player.user_input = 'play'

    expect(compare.is_play?).to be true

  end

  it 'can find cheat inputs' do
    player = Player.new
    compare = Compare.new('gggg')

    compare.player.user_input = 'c'
    expect(compare.is_cheat?).to be true

    compare.player.user_input = 'cheat'

    expect(compare.is_cheat?).to be true
  end

  it 'can find matching characters' do
    compare = Compare.new(['r', 'g', 'y', 'b'])

    expect(compare.character_match('rrby')).to eq(['r', 'y', 'b'])

    compare = Compare.new(['y', 'b', 'y', 'b'])

    expect(compare.character_match('grby')).to eq(['y', 'b'])
  end

  it 'can find matching indexes' do
    compare = Compare.new(['r', 'g', 'y', 'b'])

    expect(compare.index_match('rrby')).to eq(['r'])
  end

  it 'can determine if user guess is correct' do
    compare = Compare.new(['g', 'g', 'g', 'g'])

    expect(compare.user_won?('gggg')).to be true
  end

end
