require './lib/sequence'
require './lib/compare'
require 'rspec'

RSpec.describe Compare do

  it 'exists' do
    compare = Compare.new(['g','b','y','y'])

    expect(compare).to be_a(Compare)
  end

  it 'has attributes' do
    compare = Compare.new(['g','b','y','y'])

    expect(compare.random_sequence).to eq(['g', 'b', 'y', 'y'])
    expect(compare.guess_count).to eq(0)
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
