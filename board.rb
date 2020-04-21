require "./player.rb"

class Board
  attr_accessor :grid

  def initialize
    @grid = Array.new(3) { Array.new(3, "-") }
  end

  def display_board
    @grid.each do |row|
      puts
      print "\t#{row[0]} #{row[1]} #{row[2]}\n"
    end
  end

  def full_grid?
    @grid.each do |row|
      return false if row.any?("-")
    end
    true
  end

  def target_empty?(coordinates)
    row = coordinates[0]
    col = coordinates[1]
    @grid[row][col] == "-" ? true : false
  end

  def full_row?
    @grid.each do |row|
      if ((row[0] == row[1]) && (row[1] == row[2])) && (row[0] != "-")
        return true
      end
    end
    false
  end

  def full_col?
    flipped = @grid.transpose
    flipped.each do |row|
      if (row[0] == row[1]) && (row[1] == row[2]) && (row[0] != "-")
        return true
      end
    end
    false
  end

  def full_diagonal_down?
    if (@grid[0][0] == @grid[1][1]) && (@grid[1][1] == @grid[2][2]) && (@grid[0][0] != "-")
      return true
    end
    false
  end

  def full_diagonal_up?
    if (@grid[2][0] == @grid[1][1]) && (@grid[1][1] == @grid[0][2]) && (@grid[2][0] != "-")
      return true
    end
    false
  end
end
