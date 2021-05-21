require './lib/messages'
require './lib/player'

class Game
  attr_reader :player, :guess_count, :message
  def initialize (message)
    @message = message
    @guess_count = 0
  end

  def start
      p @message.welcome_message
  end

  def start_menu
    if @message.compare.is_quit? == true
        message.exit_message
    elsif @message.compare.is_instructions? == true
        message.instructions_message
    elsif @message.compare.is_play? == true
      @message.sequence.randomize_characters
      message.beginner_sequence_message
    elsif @message.compare.is_cheat? == true
        message.cheat_message
    else
        message.invalid_input
    end
  end

  def game_flow
    if @message.compare.is_guess? == true
      @guess_count += 1
      if @message.compare.too_long == true
        @message.too_long
      elsif  @message.compare.too_short == true
        @messages.too_short
      elsif @messages.compare.user_won? == false
        @messages.feedback
      end

    elsif @message.compare.start_menu_inputs == true
      self.start_menu
    else
      @message.invalid_input
    end
  end

  def end_game
    if @message.compare.is_quit? == true
       @message.exit_message
    end
  end

  def time_start
    @start_time = Time.now
  end

  def total_time_elapsed
    @end_time = Time.now
    @total_time = @end_time - @start_time
  end
end
