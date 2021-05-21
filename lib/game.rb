class Game
  attr_reader :player, :guess_count
  def initialize
    @player = Player.new
    @guess_count = 0
  end

  def start
      p message.welcome
      self.start_menu
  end

  def start_menu
    @player.get_user_input
    if @player.quit == true
        messages.exit
    elsif @player.instructions == true
        messages.instructions
    elsif @player.play == true
        messages.beginner_sequence_message
        sequence.randomize_characters
        self.game_flow
    elsif @player.cheat == true
        messages.cheat_message
    else
        messages.invalid_input
    end
  end

  def game_flow
    if @player.user_input != @player.start_menu_inputs

      loop do
        @player.get_user_input
        @guess_count += 1

        if  @player.too_long == true
          p messages.too_long
        elsif  @player.too_short == false
          p messages.too_short
        elsif @player.user_input != sequence.random_sequence
          p messages.feedback
        end

        if @compare.user_won? == true
          p messages.winner_message
          self.start_menu
          break
        end
      end

    elsif @player.user_input == @player.start_menu_inputs
      self.start_menu
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
