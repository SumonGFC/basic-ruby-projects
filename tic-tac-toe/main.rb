require_relative "lib/game_board.rb"

class Game
  ADD = :add
  POS = {
    "TL" => [0, 0],
    "TM",
    "TR",
    "ML",
    "MM",
    "MR",
    "BL",
    "BM",
    "BR"
  }

  def initialize
  end

  def get_board(game_board)
    game_board.state
  end

  def prompt_start
  end
end

game_board = GameBoard.new
game = Game.new

game.play(game_board)
