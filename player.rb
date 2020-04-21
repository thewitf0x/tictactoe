require "./board.rb"
require "./game.rb"

class Player
  attr_reader :name

  def initialize
    @name = player_name()
  end

  def player_name
    puts "\nWhat's your name?\n"
    user_name = gets.chomp
    user_name.capitalize!
    return user_name
  end
end
