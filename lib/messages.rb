require './lib/sequence'
require './lib/compare'

class Message
  attr_reader :sequence, :compare
  def initialize(compare)
    @compare = compare
  end

  def welcome_message
    print "\n\n\n Welcome to MASTERMIND\n\n\n Would you like to (p)lay, read the (i)nstructions, or (q)uit?\n\n\n"
  end

  def instructions_message
    print "\n\n\n I will generate a sequence with four elements made up of:(r)ed, \n (g)reen, (b)lue, and (y)ellow. \n\n\n Your objective is to guess the sequence. \n\n\n You will be provided with feedback for each of your guesses with the: \n\n\n * correct number of colors \n\n\n * the correct of positions those colors are in \n\n\n * the number of guesses you've taken \n\n\n When you have guessed the correct sequence you will also be given the amount of time it took. \n\n\n You may request the sequence be revealed at anytime by pressing 'c' or 'cheat'. \n\n\n Use (q)uit at any time to end the game."
  end

  def beginner_sequence_message
    print "\n\n\n I have generated a beginner sequence with four elements made up of: \n\n\n (r)ed, (g)green, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.\n\n\n What's your guess?\n\n\n"
  end

  def feedback_message
    print "\n\n\n '#{@compare.player.user_input.upcase}' has #{@compare.character_match(@compare.player.user_input).size} of the correct elements with #{@compare.index_match(@compare.player.user_input).size} in the correct positions \n\n\n You've guessed #{@compare.guess_count} times \n\n\n "
  end

  def cheat_message
    print "\n\n\n The sequence generated was #{@compare.sequence}. \n\n\n Enter this code to win, to easily test winning method.\n\n\n"
  end

  def too_long_or_short
    if @compare.too_long == true
      print "Your guess is too long. Your guess must be a sequence with four elements made up of: \n *(r)ed \n *(g)reen \n *(b)lue \n *(y)ellow. Each color may be used any number of times. Please guess again."
    elsif @compare.too_short == true
      print "Your guess is too short. Your guess must be a sequence with four elements made up of: \n *(r)ed \n *(g)reen \n *(b)lue \n *(y)ellow. Each color may be used any number of times. Please guess again."
    end
  end

  def winner_message
    print "\n\n\n Congratulations! You guessed the sequence \n\n\n #{@compare.sequence} \n\n\n in #{@compare.guess_count} guesses over #{@compare.total_time_elapsed}. \n\n\n Do you want to (p)lay again or (q)uit?"
  end

  def invalid_input
    print "\n\n\n This input is invalid. Please try again. \n\n\n"
  end

  def exit_message
    print "\n\n\n Thanks for visiting Mastermind! \n\n\n"
  end

end
