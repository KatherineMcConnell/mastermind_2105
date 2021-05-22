require './lib/sequence'

RSpec.describe Sequence do
  before(:each) do
    @sequence = Sequence.new
  end

  it 'exists' do

    expect(@sequence).to be_an_instance_of(Sequence)
  end

  it 'has an array of characters' do

    expect(@sequence.characters).to eq(["r","g","b","y"])
  end

  it 'can randomize_characters' do
    @sequence.randomize_characters

    expect(@sequence.randomize_characters).not_to eq(["r","g","b","y"])
  end

  it 'can store random characters' do

    expect(@sequence.random_sequence).to eq(@sequence.random_sequence)
  end
end
