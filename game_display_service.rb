class GameDisplayService
  PLAYER_1 = 1
  PLAYER_2 = 20

  def initialize
    super
  end

  def display_gameboard(stored_moves)
    counter = 0
    row = 1
    game_board_length = stored_moves.get_gameboard_length
    counter_interval = stored_moves.get_gameboard_interval

    print_columns(counter_interval)

    while counter < game_board_length do
      print row
      print ' '
      stored_moves.stored_moves[counter..counter+2].each do |value|
        print '[' + move_interpreter(value[0]) + ']'
      end
      counter += counter_interval
      puts ''
      row += 1
    end
  end

  def print_player_instructions(player)
    puts "Player #{player}, please make a move. Enter row and column like this i.e. 2,1"
  end

  def winning_message(player)
    puts "Player #{player.to_s}, congratulations, you won!!! Would you like to play again? (Yes or no)"
  end

  def tie_message
    puts "This game ended in a tie. Would you like to play again? (Yes or no)"
  end

  def goodbye
    puts "Goodbye for now!"
  end

  private
  def move_interpreter(move)
    if move == PLAYER_1
      'X'
    elsif move == PLAYER_2
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
