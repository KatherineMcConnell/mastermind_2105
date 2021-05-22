class Sequence
  attr_reader :characters,
              :random_sequence

  def initialize
    @characters = ["r","g","b","y"]
    @random_sequence = randomize_characters
  end

  def randomize_characters
    Array.new(4){@characters.sample}
  end
end

#p Sequence.new.random_sequence
