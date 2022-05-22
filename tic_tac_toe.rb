class TicTacToe
  PLAYER_1 = 1
  PLAYER_2 = 10
  #store answers in data structure
  stored_moves = [
    [0, 0, 0],
    [0, 0, 0],
    [0, 0, 0]
  ]
  new_move = [1, 2]
  player = 1
  # each time a guess is stored, check data structure for win by seeing if they're 3 answers of same int
  def store_answer(stored_moves, new_move, player)
    #error if outside of game board or move already made
    raise 'Outside of game board' unless new_move[0] <= 2 && new_move[1] <= 2
    raise 'Move already made' unless can_move?([stored_moves[new_move[1]][new_move[0]]])

    stored_moves[new_move[1]][new_move[0]] = player
  end

  def check_for_win(stored_moves)
    # sum array and see if win - player 1 wins with 3 and player 2 with 30
    #rows first
    row_1 = stored_moves[0].sum
    row_2 = stored_moves[1].sum
    row_3 = stored_moves[2].sum
    column_1 = [stored_moves[0][0], stored_moves[0][1], stored_moves[0][2]].sum
    column_2 = [stored_moves[1][0], stored_moves[1][1], stored_moves[1][2]].sum
    column_3 = [stored_moves[2][0], stored_moves[2][1], stored_moves[2][2]].sum
    diag_1 = [stored_moves[0][0], stored_moves[1][1], stored_moves[2][2]].sum
    diag_2 = [stored_moves[0][2], stored_moves[1][1], stored_moves[2][0]].sum

    possible_wins = [row_1, row_2, row_3, column_1, column_2, column_3, diag_1, diag_2]

    if possible_wins.include?(3)
      return :player_1
    elsif possible_wins.include?(30)
      return :player_2
    else
      return nil
    end
  end

  private
  def can_move?(value)
    value.zero?
  end
  # print final string with win or with next turn
end
