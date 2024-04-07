require_relative "lib/game_board.rb"

class Game
  attr_reader :player_x, :player_o

  ADD = :add
  POS = {
    "TL" => [0, 0], # top left
    "TM" => [0, 2], # top middle
    "TR" => [0, 4], # top right
    "ML" => [2, 0], # ...
    "MM" => [2, 2],
    "MR" => [2, 4],
    "BL" => [4, 0],
    "BM" => [4, 2],
    "BR" => [4, 4]
  }

  def initialize
    @player_x = "X"
    @player_o = "O"
  end

  def get_board(game_board)
    game_board.state
  end
end


# Program
game_board = GameBoard.new
game = Game.new
loop do
  print "Would you like to play tic-tac-toe? (y/n): "
  start = gets.chomp
  if start.downcase == "y"
    # play game
  elsif start.downcase == "n"
    puts "Thanks for playing!"
    exit
  else
    puts "Unknown Command '#{start}'"
  end
end
