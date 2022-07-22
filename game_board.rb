class GameBoard
  stored_moves = [
    [],[],[],
    [],[],[],
    [],[],[]
  ]

  private
  def display_gameboard(moves)
    counter = 0
    row = 1
    game_board_length = 9
    counter_interval = Math.sqrt(game_board_length)

    print_columns(3)

    while counter < game_board_length do
      print row
      print ' '
      moves[counter..counter+2].each do |value|
        print '[' + move_interpreter(value) + ']'
      end
      counter += counter_interval
      puts ''
      row += 1
    end
  end

  def move_interpreter(move)
    if move[0] == 10
      'X'
    elsif move[0] == 30
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
