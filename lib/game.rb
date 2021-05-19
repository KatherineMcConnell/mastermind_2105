class Game
  def initialize
    @code_breaker_input #??
  end

  def start
      p message.welcome
  end

  def start_menu
    @code_breaker_input = gets.chomp
    self.quit
    self.instructions
    self.play
    self.cheat

  end

  def quit
    #double check calling class variables inside class
    if @code_breaker_input == 'q' || 'quit'
      p message.quit
      exit
    end
  end

  def instructions
    if @code_breaker_input == 'i' || 'instructions'
      p message.instructions
    end
  end

  def play
    if @code_breaker_input == 'p' || 'play'
      p message.beginner_sequence
      # run method that grabs user guess
    end
  end

  def cheat
    if @code_breaker_input == 'c' || 'cheat'
      p message.cheat
    end
  end

  def invalid_input
    if !@code_breaker_input == 'q' || 'quit' || 'i' || 'instructions' || 'p' || 'play' || 'c' || 'cheat'
      p message.invalid_input
    end
  end

  def game_flow
    if guess != message.correct_guess
      p message.feedback
      guess_again
    if guess == message.correct_guess
      p message.correct_guess
      start_menu
    end
  end



end
