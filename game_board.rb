#!/usr/bin/env ruby
class GameBoard
  attr_reader :stored_moves

  def initialize
    @stored_moves = [
      [],[],[],
      [],[],[],
      [],[],[]
    ]
  end

  def get_gameboard_length()
    @stored_moves.length
  end

  def get_gameboard_interval()
    Math.sqrt(@stored_moves.length)
  end

  end
