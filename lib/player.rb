class Player
  attr_accessor :user_input
  def initialize
    @user_input = ''
  end

  def get_user_input
    @user_input = gets.chomp
  end
  
end
