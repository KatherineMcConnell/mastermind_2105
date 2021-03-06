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
    #binding.pry
    (sequence & user_guess).flat_map do |character|
      [character] * [sequence.count(character), user_guess.count(character)].min
    end
  end

  def index_match(user_input)
    user_guess = user_input.split("")
    matched_characters = @sequence.zip(user_guess)
    matched_characters.map do |matched_character|
      if matched_character[0] == matched_character[1]
        matched_character[0]
      end
    end.flatten.compact
  end

  def user_won?(user_input)
    user_input == @sequence.join
  end

  def guess_counter
    @guess_count += 1
  end

  def time_start
    @start_time = Time.now if @start_time.nil?
  end

  def total_time_elapsed
    end_time = Time.now
    total_time = end_time - @start_time
    seconds = (total_time % 60).floor
    minutes = (total_time / 60).floor
    total_time = "#{minutes} minutes, #{seconds} seconds"
  end

end
