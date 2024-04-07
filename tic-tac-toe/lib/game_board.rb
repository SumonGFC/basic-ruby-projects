
class GameBoard
  attr_accessor :state

  def initialize
  end
  
  # Public  
  def update_board(cmd=nil, player=nil, pos=nil)
    if cmd == :add
      add_move(player, pos)
    else
      reset_board()
    end
  end

  private
  
  def add_move(player, pos)
  end

  def reset_board
  end
end
