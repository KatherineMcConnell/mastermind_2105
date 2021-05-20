class Player

  def initialize
  @user_input = gets.chomp
  end

  def invalid_input
    !@user_input == 'q' || 'quit' || 'i' || 'instructions' || 'p' || 'play' || 'c' || 'cheat' || too_long || too_short || guess
  end

  def guess

  end

  def too_long
    @user_input.size > 4
  end

  def too_short
    @user_input.size < 4
  end

  def quit
    @user_input == 'q' || 'quit'
  end

  def instructions
    @user_input == 'i' || 'instructions'
  end

  def play
    @user_input == 'p' || 'play'
  end

  def cheat
    @user_input == 'c' || 'cheat'
  end


end
