class Game
  def initialize
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

***********************************************************************
class Game
  attr_reader:
  def initialize
  end

  #the method start begins the game
  def start
    #welcome message prints asking for user to choose to play, quit, or go to instructions
    #,but what if the don't hit one of these buttons?
    # if user_input == p
    # first_turn
    # if user_input == i
    # print instructions_message
    #print welcome_message
    # if user_input == q
    # exit!
    # else \n\n\nInvalid_input\n\n\n
  end

  def first_turn
    #print beginner_sequence_message
    #user_input = gets.chomp
    #after they make their first guess is when we will want to start timing them
  end

  
end
