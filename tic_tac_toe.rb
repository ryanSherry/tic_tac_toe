class TicTacToe
  #store answers in data structure
  # create game board
  @stored_moves = GameBoard.new
  @game_service = GameService.new
  @game_display_service = GameDisplayService.new
  @player_1_value = GameService::PLAYER_1
  @player_2_value = GameService::PLAYER_2
  #set the player
  @player_turn = 1

  #print the game board
  @game_display_service.display_gameboard(@stored_moves)
  #print player instructions
  @game_display_service.print_player_instructions(@player_turn)
  #get input from user
  # update game baord
  # print game board
  # check for win
    # if win, print winning message and ask if they want to play again
  # if no win
    # update game board
    # update player turn
    #loop

  private
  def get_player_value(player)
    player == 1 ? @player_1_value : @player_2_value
  end
end
