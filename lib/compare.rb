#require './runner'
require 'pry'

class Compare
  attr_reader :sequence, :guess_count, :player
  def initialize
    @sequence = Sequence.new.random_sequence
    @player = Player.new
    @start_menu_inputs = 'q quit i instructions p play c cheat'
    @guess_count = 0
  end

  def is_menu_input?
    @start_menu_inputs.include?(@player.user_input)
  end

  def is_guess?
    !@start_menu_inputs.include?(@player.user_input)
  end

  def too_long
    @player.user_input.size > 4
  end

  def too_short
    @player.user_input.size < 4
  end

  def is_quit?
    #binding.pry
    'q quit'.include?(@player.user_input)
  end

  def is_instructions?
    'i instructions'.include?(@player.user_input)
  end

  def is_play?
    'p play'.include?(@player.user_input)
  end

  def is_cheat?
    'c cheat'.include?(@player.user_input)
  end

  def character_match
    user_guess = @player.user_input.split("")
    #binding.pry
    @sequence.find_all do |character|
      user_guess.include?(character)
    end
  end

  def index_match
    user_guess = @player.user_input.split("")
    #km- I know we can use .zip somehow to compare here to shorten this.
    @matched_characters = []
    #binding.pry
    if @sequence[0] == user_guess[0]
      @matched_characters << @sequence[0]
    elsif @sequence[1] == user_guess[1]
      @matched_characters << @sequence[1]
    elsif @sequence[2] == user_guess[2]
      @matched_characters << @sequence[2]
    elsif @sequence[3] == user_guess[3]
      @matched_characters << @rsequence[3]
    end
    return @matched_characters
  end

  def user_won?
    @player.user_input == @sequence.join
  end

  def guess_counter
    @guess_count += 1
  end

  def time_start
    @start_time = Time.now
  end

  def total_time_elapsed
    @end_time = Time.now
    @total_time = @end_time - @start_time
  end
end
