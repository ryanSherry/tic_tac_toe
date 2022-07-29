class GameDisplayService
  PLAYER_1 = 1
  PLAYER_2 = 20

  def display_gameboard(stored_moves)
    counter = 0
    row = 1
    game_board_length = stored_moves.get_gameboard_length
    counter_interval = stored_moves.get_gameboard_interval

    print_columns(counter)

    while counter < game_board_length do
      print row
      print ' '
      stored_moves[counter..counter+2].each do |value|
        print '[' + move_interpreter(value) + ']'
      end
      counter += counter_interval
      puts ''
      row += 1
    end
  end

  def print_player_instructions(player)
    puts "Player #{player}, please make a move. Enter your move with the row number " +
           "first followed by the column number i.e. 1,3"
  end

  private
  def move_interpreter(move)
    if move[0] == PLAYER_1
      'X'
    elsif move[0] == PLAYER_2
      'O'
    else
      ' '
    end
  end

  def print_columns(number)
    print '   '
    (1..number).each do |n|
      print n
      print '  '
    end
    puts ''
  end

end
