class GameService
  PLAYER_1 = 1
  PLAYER_2 = 20
  PLAYER_1_TURN_VALUE = 1
  PLAYER_2_TURN_VALUE = 2

  def store_answer(stored_moves, new_move, player)
    #error if outside of game board or move already made
      @new_move = new_move.split(',').map(&:to_i)
      raise 'Outside of game board' unless (@new_move[0] <= stored_moves.get_gameboard_interval &&
        @new_move[1] <= stored_moves.get_gameboard_interval)
        if can_move?(stored_moves.get_stored_moves[calculate_move_location(stored_moves, @new_move)])
          save_move(stored_moves, @new_move, player)
        else
          puts 'Move already made, make a different move, try again'
          @new_answer = gets.chomp
          store_answer(stored_moves, @new_answer, player)
        end
  end

  def check_for_win(stored_moves)
    # sum array and see if win - player 1 wins with 3 and player 2 with 30
    #rows first
    row_1 = [stored_moves.get_stored_moves[0][0], stored_moves.get_stored_moves[1][0], stored_moves.get_stored_moves[2][0]].compact.sum
    row_2 = [stored_moves.get_stored_moves[3][0], stored_moves.get_stored_moves[4][0], stored_moves.get_stored_moves[5][0]].compact.sum
    row_3 = [stored_moves.get_stored_moves[6][0], stored_moves.get_stored_moves[7][0], stored_moves.get_stored_moves[8][0]].compact.sum
    column_1 = [stored_moves.get_stored_moves[0][0], stored_moves.get_stored_moves[3][0], stored_moves.get_stored_moves[6][0]].compact.sum
    column_2 = [stored_moves.get_stored_moves[1][0], stored_moves.get_stored_moves[4][0], stored_moves.get_stored_moves[7][0]].compact.sum
    column_3 = [stored_moves.get_stored_moves[2][0], stored_moves.get_stored_moves[5][0], stored_moves.get_stored_moves[8][0]].compact.sum
    diag_1 = [stored_moves.get_stored_moves[0][0], stored_moves.get_stored_moves[4][0], stored_moves.get_stored_moves[8][0]].compact.sum
    diag_2 = [stored_moves.get_stored_moves[2][0], stored_moves.get_stored_moves[4][0], stored_moves.get_stored_moves[6][0]].compact.sum
    tie = [
      stored_moves.get_stored_moves[0][0], stored_moves.get_stored_moves[1][0], stored_moves.get_stored_moves[2][0],
      stored_moves.get_stored_moves[3][0], stored_moves.get_stored_moves[4][0], stored_moves.get_stored_moves[5][0],
      stored_moves.get_stored_moves[6][0], stored_moves.get_stored_moves[7][0], stored_moves.get_stored_moves[8][0]
    ].compact

    possible_wins = [row_1, row_2, row_3, column_1, column_2, column_3, diag_1, diag_2]

    if possible_wins.include?(3)
      return :player_1
    elsif possible_wins.include?(60)
      return :player_2
    elsif tie.length == 9
      return :tie
    else
      return nil
    end
  end

  def switch_player(player)
    player == PLAYER_1_TURN_VALUE ? PLAYER_2_TURN_VALUE : PLAYER_1_TURN_VALUE
  end

  def same_player(player)
    player
  end

  private
  def can_move?(value)
    value.empty?
  end

  def player_value(player)
    player == PLAYER_1_TURN_VALUE ? PLAYER_1 : PLAYER_2
  end

  def calculate_move_location(stored_moves, new_move)
    interval = stored_moves.get_gameboard_interval
    row = new_move[0]
    column = new_move[1]

    #calculate move location based on row and column
    (row * interval - (interval - 1) + (column - 1) - 1)
  end

  def save_move(stored_moves, new_move, player)
    stored_moves.get_stored_moves[calculate_move_location(stored_moves, new_move)][0] = player_value(player)
  end
end
