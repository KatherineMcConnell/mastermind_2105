require './lib/sequence'
require './lib/compare'
require 'rspec'

RSpec.describe Compare do

  it 'exists' do
    compare = Compare.new('gggg')

    expect(compare).to be_a(Compare)
  end

  it 'has attributes' do
    compare = Compare.new('gggg')

    expect(compare.user_input).to eq('gggg')
  end

  it 'can find start menu inputs' do
    compare = Compare.new('quit')

    expect(compare.is_menu_input?).to be true
  end

  it 'can find guess inputs' do
    compare = Compare.new('gggg')

    expect(compare.is_guess?).to be true
  end

  it 'can determine if guess is too long' do
    compare = Compare.new('rgbyb')

    expect(compare.too_long).to be true

    compare = Compare.new('gyb')

    expect(compare.too_long).to be false
  end

  it "can determine if guess is too short" do
    compare = Compare.new('gyb')

    expect(compare.too_short).to be true

    compare = Compare.new('rgybb')

    expect(compare.too_short).to be false
  end

  it 'can find quit inputs' do
    compare = Compare.new('quit')

    expect(compare.is_quit?).to be true
  end

  it 'can find instruction inputs' do
    compare = Compare.new('i')

    expect(compare.is_instructions?).to be true
  end

  it 'can find play inputs' do
    compare = Compare.new('play')

    expect(compare.is_play?).to be true

  end

  it 'can find cheat inputs' do
    compare = Compare.new('c')

    expect(compare.is_cheat?).to be true
  end

  it 'can find matching characters' do
    compare = Compare.new('gggg')


    expect(compare.character_match).to eq(['g'])
  end

  it 'can find matching indexes' do
    compare = Compare.new('gggg')

    expect(compare.index_match).to eq(['g'])
  end

  it 'can determine if user guess is correct' do
    compare = Compare.new('gyby')

    expect(compare.user_won?).to be true
  end

end
