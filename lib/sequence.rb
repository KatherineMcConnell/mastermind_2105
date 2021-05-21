class Sequence
  attr_reader :characters,
              :random_sequence

  def initialize
    @characters = ["R","G","B","Y"]
    #km - changed @characters to upcase to solve case insensitive
    @random_sequence = randomize_characters
    #@random_sequence = [] (this is getting reassigned below)
  end

  def randomize_characters
    #km - changed variable set equal to and set randomize_characters = to @random_sequence in initialize
    #@random_sequence = (variables getting reassigned)
    Array.new(4){@characters.sample}
  end
end

# p Sequence.new.random_sequence
