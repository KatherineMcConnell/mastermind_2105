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

  it 'checks lowercase format for user guess' do
    compare = Compare.new(['g','b','y','y'])

    compare.user_guess = ['g', 'g', 'g', 'g']

    expect(compare.is_lowercase?).to be true
  end

  it 'can get user guess' do
    compare = Compare.new(['g','b','y','y'])

    compare.user_guess = ['g', 'g', 'g', 'g']

    expect(compare.get_guess).to eq(['g', 'g', 'g', 'g'])
  end

  it 'can keep track of guess count' do
    compare = Compare.new(['g','b','y','y'])

    expect(compare.guess_counter).to eq(1)
    expect(compare.guess_counter).to eq(2)
  end

  it 'can find matching characters' do
    compare = Compare.new(['g','b','y','y'])

    compare.user_guess = ['g', 'g', 'g', 'g']

    expect(compare.character_match).to eq(['g'])
  end

  it 'can find matching character indexes' do
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
