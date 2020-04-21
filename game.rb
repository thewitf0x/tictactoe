require "byebug"
require "./board.rb"
require "./player.rb"

class Game
  attr_accessor :player_1, :player_2, :grid
  attr_reader :current_player, :current_player_icon, :win, :draw, :game_over

  def initialize
    @grid = Board.new
    @player_1 = Player.new
    @player_2 = Player.new
    @win = false
    @draw = false
    @game_over = false
    @current_player = @player_1
    @current_player_icon = "X"
  end

  def switch_turn
    if @current_player == @player_1
      @current_player = @player_2
      @current_player_icon = "O"
    else
      @current_player = @player_1
      @current_player_icon = "X"
    end
  end

  def take_turn
    puts "\nEnter your move, #{@current_player.name.upcase}, using coordinates for row and column from 1 to 3, eg. 2,2 (for the middle)\n\n"
    make_move()
    win?() || draw?()
  end

  def make_move()
    coordinates = get_coords()
    if @grid.target_empty?(coordinates)
      fill_coords(coordinates)
    else
      puts "\nSomeone has already played a move there. Try different coordinates!\n\n"
      make_move()
    end
  end

  def get_coords
    player_move = gets.chomp
    player_move = player_move.split(",")
    coordinates = player_move.map(&:to_i)
    coordinates.each do |num|
      if coordinates.length != 2 || num > 3 || num <= 0
        puts "\nYou can't do that! Try again.\n\n"
        return get_coords()
      end
    end
    coordinates.map! { |coord| coord - 1 }
    coordinates
  end

  def fill_coords(coordinates)
    row = coordinates[0]
    col = coordinates[1]
    @grid.grid[row][col] = "#{@current_player_icon}"
    @grid.display_board()
  end

  def win?
    if @grid.full_row? || @grid.full_col?
      @win = true
      @game_over = true
      return true
    elsif @grid.full_diagonal_up? || @grid.full_diagonal_down?
      @win = true
      @game_over = true
      return true
    end
    false
  end

  def draw?
    if @grid.full_grid?
        @draw = true
        @game_over = true
        return true
    end
    false
  end

  def you_win
    puts "\nYOU WIN #{@current_player.name.upcase}!\n\n"
  end

  def you_draw
    puts "\nIT'S A DRAW!\n\n"
  end
end
