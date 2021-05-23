#require './runner'
require 'pry'

class Compare
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
    require "pry"; binding.pry
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
    sequence.intersection(user_guess)
    #binding.pry
  end

  def index_match(user_input)
    user_guess = user_input.split("")
    matched_characters = @seqence.zip(user_guess)
    number_of_index_matches = matched_characters.find_all{ |matched_characters| matched_characters[0] == matched_characters[1].count}
  end
  #   #km- I know we can use .zip somehow to compare here to shorten this.
  #   matched_characters = []
  #   #binding.pry
  #   if @sequence[0] == user_guess[0]
  #     matched_characters << @sequence[0]
  #   end
  #   if @sequence[1] == user_guess[1]
  #     matched_characters << @sequence[1]
  #   end
  #   if @sequence[2] == user_guess[2]
  #     matched_characters << @sequence[2]
  #   end
  #   if @sequence[3] == user_guess[3]
  #     matched_characters << @sequence[3]
  #   end
  #   #binding.pry
  #   return matched_characters
  # end

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
    @total_time.round = @end_time - @start_time
  end
  #needs to be split into min and then seconds
end
