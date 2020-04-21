require './game.rb'

game = Game.new

game.grid.display_board

until game.game_over
    game.switch_turn
    game.take_turn
end

if game.win?
  game.you_win
else
  game.you_draw
end

puts "\n\nPlay again? Y/N\n\n"
play_again = gets.chomp
if play_again.upcase == "Y"
    open("./play.rb")
end