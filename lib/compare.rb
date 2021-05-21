class Compare
  attr_reader :random_sequence, :guess_count
  attr_accessor :user_guess
  def initialize(random_sequence)
    @random_sequence = random_sequence
    @guess_count = 0
    @user_guess = []
  end

  def get_guess
    #km - changed user_guess to upcase to solve case insensitive
    @user_guess = gets.chomp.split("").upcase
    #binding.pry
    if @user_guess.count == 4 && self.is_lowercase? == true
      @user_guess
      #all lowercase stuff needs to go
    end
    #this method will forward to messages class to print correct error message
  end

  # 'guesses are insensitive'per instructions
  def is_lowercase?
    @user_guess.all? { |character| character == character.downcase }
  end

  def guess_counter
    @guess_count += 1
  end

  def character_match
    @random_sequence.find_all do |character|
      @user_guess.include?(character)
    end
  end

  def index_match
    #km- I know we can use .zip somehow to compare here to shorten this.
    @matched_characters = []
    if @random_sequence[0] == @user_guess[0]
      @matched_characters << @random_sequence[0]
    elsif @random_sequence[1] == @user_guess[1]
      @matched_characters << @random_sequence[1]
    elsif @random_sequence[2] == @user_guess[2]
      @matched_characters << @random_sequence[2]
    elsif @random_sequence[3] == @user_guess[3]
      @matched_characters << @random_sequence[3]
    end
    return @matched_characters
  end

  def user_won?
    @user_guess == @random_sequence
  end
end
