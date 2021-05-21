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
