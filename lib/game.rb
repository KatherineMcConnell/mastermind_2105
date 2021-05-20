class Game
  def initialize
    @player = Player.new
  end

  def start
      p message.welcome
      start_menu
  end

  def start_menu
    if @player.start_menu_inputs == true
      if @player.quit == true
          exit
      elsif @player.instructions == true
          messages.instructions
      elsif @player.play == true
          messages.beginner_sequence_message
      elsif @player.cheat == true
          messages.cheat_message
      else
          print "Invalid_input"
      end
    end
  end

  def guess_again
  end

  def game_flow
    if guess != sequence.random_sequence
      p message.feedback
      # guess_again
    elsif guess == @player.too_long
      p message.too_long
      #guess_again
    elsif guess == @player.too_short
      p message.too_short

    elsif guess == sequence.random_sequence
      p message.correct_guess
      @player.play
      @player.quit
    end
  end

end
