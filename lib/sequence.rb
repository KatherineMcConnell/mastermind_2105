class Sequence
  attr_reader :characters,
              :random_sequence

  def initialize
    @characters = ["r","g","b","y"]
    @random_sequence = []
  end

  def randomize_characters
    @random_sequence = Array.new(4){@characters.sample}
  end
end
