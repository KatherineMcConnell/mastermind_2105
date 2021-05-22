require './lib/messages'
require './lib/sequence'
require './lib/compare'
require './lib/player'

RSpec.describe Message do

  it 'exists' do
    compare = Compare.new('gbyb')
    message = Message.new(compare)

    expect(message).to be_a(Message)
  end

  it 'has attributes' do
    compare = Compare.new('gbyb')
    message = Message.new(compare)

    expect(message.compare).to eq(compare)
  end

end
