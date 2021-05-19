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

  it 'starts with an empty array' do

    expect(@sequence.random_sequence).to eq([])
  end

  it 'can randomize_characters' do
    @sequence.randomize_characters

    expect(@sequence.random_sequence).not_to eq(["r","g","b","y"])
  end

end
