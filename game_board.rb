public class GameBoard
         @stored_moves = [
           [],[],[],
           [],[],[],
           [],[],[]
         ]

  def get_gameboard_length()
    @stored_moves.length
  end

  def get_gameboard_interval()
    Math.sqrt(@stored_moves.length)
  end

  end
