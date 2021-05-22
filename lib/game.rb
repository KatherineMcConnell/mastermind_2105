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
      end

    elsif @message.compare.is_menu_input? == true
      self.start_menu
    else
      @message.invalid_input
    end
  end

  # def game_flow
  #   binding.pry
  #   loop do
  #     @player.get_user_input
  #     if @message.compare.is_guess? == true
  #       @compare.guess_counter
  #       if @message.compare.too_long == true
  #         @message.too_long
  #       elsif  @message.compare.too_short == true
  #         @messages.too_short
  #       elsif @messages.compare.user_won? == false
  #         @messages.feedback
  #       end
  #     elsif @message.compare.is_menu_input? == true
  #       self.start_menu
  #     else
  #       @message.invalid_input
  #     end
  #     if @message.compare.is_quit? == true
  #       @message.exit_message
  #       break
  #     end
  #   end
  # end

  def play_game
    self.start
    self.start_menu
  end

  def end_game
    if @message.compare.is_quit? == true
       @message.exit_message
    end
  end

end
