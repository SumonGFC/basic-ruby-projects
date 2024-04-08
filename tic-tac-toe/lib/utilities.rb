module Utilities
  def game_decided?(player_moves, positions)
    rows = []
    cols = []
    diag1 = []
    diag2 = []

    player_moves.each do |pos|
      rows.push(pos[0])
      cols.push(pos[1])
      diag1.push(pos) if pos[0] == pos[1]
      diag2.push(pos) if (pos.eql?([4,0]) || pos.eql?([2,2]) || pos.eql?([0,4]))
    end

    rows.uniq.each do |num|
      return true if (rows.count(num) == 3)
    end

    cols.uniq.each do |num|
      return true if (cols.count(num) == 3)
    end

    return true if (diag1.length == 3 || diag2.length == 3)

    return false
  end


  def randomize_players
    return [0, 1] if rand >= 0.5
    return [1, 0]
  end
end
