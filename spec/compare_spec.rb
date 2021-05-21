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

    expect(compare.user_input).to eq(['g', 'b', 'y', 'y'])
  end

  it 'can find start menu inputs' do

  end

  it 'can find guess inputs' do

  end

  it 'can determine if guess is too long' do

  end

  it "can determine if guess is too short" do

  end

  it 'can find quit inputs' do

  end

  it 'can find instruction inputs' do

  end

  it 'can find play inputs' do

  end

  it 'can find cheat inputs' do

  end

  it 'can find matching characters' do
    compare = Compare.new(['g','b','y','y'])

    compare.user_guess = ['g', 'g', 'g', 'g']

    expect(compare.character_match).to eq(['g'])
  end

  it 'can find matchingindexes' do
    compare = Compare.new(['g','b','y','y'])

    compare.user_guess = ['g', 'g', 'g', 'g']

    expect(compare.index_match).to eq(['g'])
  end

  it 'can determine if user guess is correct' do
    compare = Compare.new(['g','b','y','y'])

    compare.user_guess = ['g','b','y','y']
    expect(compare.user_won?).to be true
  end

end
