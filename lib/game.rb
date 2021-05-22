require './lib/messages'
require './lib/player'
#require './runner'
require 'pry'

class Game
  attr_reader :player, :guess_count, :message
  def initialize (message)
    @message = message
    @player = Player.new
  end

  def start
    @message.welcome_message
    self.start_menu
  end

  def start_menu
    #binding.pry
    if @message.compare.is_quit? == true
        message.exit_message
    elsif @message.compare.is_instructions? == true
        message.instructions_message
    elsif @message.compare.is_play? == true
      @message.compare.sequence
      message.beginner_sequence_message
    elsif @message.compare.is_cheat? == true
        message.cheat_message
    else
        message.invalid_input
    end
  end

  def game_flow
    @message.compare.user_input = chomp_input
    binding.pry
    if @message.compare.is_guess? == true
      @compare.guess_counter
      if @message.compare.too_long == true
        @message.too_long
      elsif  @message.compare.too_short == true
        @messages.too_short
      elsif @messages.compare.user_won? == false
        @messages.feedback
      end

    elsif @message.compare.is_menu_input? == true
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

end
