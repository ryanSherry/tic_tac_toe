# spec/game_service_spec.rb
require_relative '../game_service'
require_relative '../game_board'

RSpec.describe "test game service", :type => :request do
  before(:each) do
    @gameservice = GameService.new
    @stored_moves = double('GameBoard', :get)
    @new_move = '1,3'
    @player = 1
  end

  describe "store answer" do
    it "should store answer correctly" do
      @gameservice.store_answer(@stored_moves, @new_move, @player)
      expect(@stored_moves[0][2]).to eq(1)
    end

  end


end
