#!/usr/bin/env ruby
require './game_board'
require './game_display_service'
require './game_service'

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
  @play_again = true

  while @play_again
  #print the game board
  @game_display_service.display_gameboard(@stored_moves)
  #print player instructions
  @game_display_service.print_player_instructions(@player_turn)
  #get input from user

  @new_move = gets.chomp
  # check if move has been made (note: add error checking)
    # if yes, ask user to make different move
    # if no, update game board and proceed
  @game_service.store_answer(@stored_moves, @new_move, @player_turn)
  # print game board
  # @game_display_service.display_gameboard(@stored_moves)
  # check for win
  @win = @game_service.check_for_win(@stored_moves) == :player_1 || @game_service.check_for_win(@stored_moves) == :player_2
  p @game_service.check_for_win(@stored_moves)
  @tie = @game_service.check_for_win(@stored_moves) == :tie
  if @win
    # if win, print winning message and ask if they want to play again
    @game_display_service.display_gameboard(@stored_moves)
    @game_display_service.winning_message(@player_turn)
    @play_again_answer = gets.chomp
    if @play_again_answer.downcase == 'yes' || @play_again_answer.downcase == 'y'
      @play_again = true
      @player_turn = @player_1_value
      @stored_moves = GameBoard.new
    else
      @play_again = false
      @game_display_service.goodbye
    end
  elsif @tie
    @game_display_service.display_gameboard(@stored_moves)
    @game_display_service.tie_message
    @play_again_answer = gets.chomp
    if @play_again_answer.downcase == 'yes' || @play_again_answer.downcase == 'y'
      @play_again = true
      @player_turn = @player_1_value
      @stored_moves = GameBoard.new
    else
      @play_again = false
      @game_display_service.goodbye
    end
  else
    @player_turn = @game_service.switch_player(@player_turn)
  end
  end
end
TicTacToe.new
