require './lib/messages'
require './lib/player'
#require './runner'
require 'pry'

class Game
  attr_reader :player, :guess_count, :message
  def initialize (message, player)
    @message = message
    @player = player
  end

  def start
    @message.welcome_message
    @player.get_user_input
  end

  def start_menu
    #binding.pry
    if @message.compare.is_quit? == true
      @message.exit_message
    elsif @message.compare.is_instructions? == true
      @message.instructions_message
      self.play_game
    elsif @message.compare.is_play? == true
      @message.compare.sequence
      @message.beginner_sequence_message
      loop do
        self.game_flow
        if @message.compare.is_quit? == true
          break
        end
      end
    elsif @message.compare.is_cheat? == true
      @message.cheat_message
    else
      @message.invalid_input
        @player.get_user_input
        start_menu
    end
  end

  def game_flow
    @player.get_user_input
    #binding.pry
    if @message.compare.is_guess? == true
      @message.compare.guess_counter
      if @message.compare.too_long_or_short? == true
        @message.too_long_or_short
      elsif @message.compare.user_won?(@player.user_input) == false
        @message.feedback_message
      elsif @message.compare.user_won?(@player.user_input) == true
        @message.winner_message
        @player.get_user_input
        start_menu
      end

    elsif @message.compare.is_menu_input? == true
      self.start_menu
    else
      @message.invalid_input
        @player.get_user_input
        game_flow
    end
  end

  def play_game
    self.start
    self.start_menu
  end

  def end_game
    if @message.compare.is_quit? == true
       @message.exit_message
       exit!
    end
  end

end
