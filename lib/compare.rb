#require './runner'
require 'pry'

class Compare
  # include TimeUtilities????
  attr_reader :sequence, :guess_count, :start_menu_inputs, :player
  def initialize(sequence)
    @sequence = sequence
    @player = Player.new
    @start_menu_inputs = ['q', 'quit', 'i','instructions', 'p', 'play', 'c', 'cheat']
    @guess_count = 0
  end

  def is_menu_input?
    @start_menu_inputs.include?(@player.user_input)
  end

  def is_guess?
    # require "pry"; binding.pry
    !@start_menu_inputs.include?(@player.user_input)
  end

  def too_long
    @player.user_input.size > 4
  end

  def too_short
    @player.user_input.size < 4
  end

  def too_long_or_short?
    @player.user_input.size != 4
  end

  def is_quit?
    #binding.pry
    ['q', 'quit'].include?(@player.user_input)
  end

  def is_instructions?
    ['i', 'instructions'].include?(@player.user_input)
  end

  def is_play?
    ['p', 'play'].include?(@player.user_input)
  end

  def is_cheat?
    ['c', 'cheat'].include?(@player.user_input)
  end

  def character_match(user_input)
    user_guess = user_input.split("")
    matching_colors = (@sequence & user_guess)
    matching_colors.size
  end

  def index_match(user_input)
    #user_guess is coming up as a nil class in here which means user_guess is not getting pulled in here properly hmmm....
    user_guess = user_input.split("")
    require "pry"; binding.pry
    #works in pry??? doesnt accept setting the variable for some reason.
    comparing = @seqence.zip(user_guess)
    number_of_index_matches = matched_characters.find_all{ |matched_characters| matched_characters[0] == matched_characters[1].count}
  end

  def user_won?(user_input)
    user_input == @sequence.join
  end

  def guess_counter
    @guess_count += 1
  end

  def time_start
    @start_time = Time.now
  end

  def total_time_elapsed
    @end_time = Time.now
    @total_time.round= @end_time - @start_time
  end
  #needs to be split into min and then seconds
end
