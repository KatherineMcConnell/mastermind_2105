require 'runner'

class Compare
  attr_reader :sequence, :user_input
  def initialize(user_input)
    @sequence = Sequence.new.randomize_characters
    @user_input = user_input
  end

  def start_menu_inputs
    @user_input == ('q' || 'quit' || 'i' || 'instructions' || 'p' || 'play' || 'c' || 'cheat')
  end

  def is_guess?
    !@user_input == ('q' || 'quit' || 'i' || 'instructions' || 'p' || 'play' || 'c' || 'cheat')
  end

  def too_long
    @user_input.size > 4
  end

  def too_short
    @user_input.size < 5
  end

  def is_quit?
    @user_input == ('q' || 'quit')
  end

  def is_instructions?
    @user_input == ('i' || 'instructions')
  end

  def is_play?
    @user_input == ('p' || 'play')
  end

  def is_cheat?
    @user_input == ('c' || 'cheat')
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
