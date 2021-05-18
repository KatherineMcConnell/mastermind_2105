class Game
  def initialize

  end

  def start
      p message.welcome
      code_breaker_input = gets.chomp
  end

  def start_menu
    if code_breaker_input == 'p' || code_breaker_input == 'play'
      self.game_flow
    elsif code_breaker_input == 'i' || 'instructions'
      p message.instructions
      self.start
    elsif code_breaker_input == 'q' || 'quit'
      exit
    else
      p message.error
    end
  end

  def game_flow
    p message.beginner_sequence
    guess = gets.chomp
  end

  def

end
