# spec/game_service_spec.rb
require_relative '../game_service'
require_relative '../game_board'

RSpec.describe 'test game service', :type => :request do
  before(:each) do
    @gameservice = GameService.new
    @stored_moves = GameBoard.new
  end

  describe 'store answer' do
    it 'should store answer correctly for player 1' do
      @new_move = '1,3'
      @player = 1
      @gameservice.store_answer(@stored_moves, @new_move, @player)
      expect(@stored_moves.get_stored_moves[2][0]).to eq(1)
    end

    it 'should store answer correctly for player 2' do
      @new_move = '2,1'
      @player = 2
      @gameservice.store_answer(@stored_moves, @new_move, @player)
      expect(@stored_moves.get_stored_moves[3][0]).to eq(20)
    end

    it 'should store answer correctly for player 2' do
      @new_move = '3,3'
      @player = 2
      @gameservice.store_answer(@stored_moves, @new_move, @player)
      expect(@stored_moves.get_stored_moves[8][0]).to eq(20)
    end
  end

  describe 'check for win' do
    it 'row 1 win for player 2' do
    self.simulate_win(@stored_moves, '1,1', '1,2', '1,3', 2)
    expect(@gameservice.check_for_win(@stored_moves)).to eq(:player_2)
    end

    it 'row 2 win for player 1' do
      self.simulate_win(@stored_moves, '2,1', '2,2', '2,3', 1)
      expect(@gameservice.check_for_win(@stored_moves)).to eq(:player_1)
    end

    it 'row 3 win for player 2' do
      self.simulate_win(@stored_moves, '3,1', '3,2', '3,3', 2)
      expect(@gameservice.check_for_win(@stored_moves)).to eq(:player_2)
    end

    it 'column 1 win for player 1' do
      self.simulate_win(@stored_moves, '1,1', '2,1', '3,1', 1)
      expect(@gameservice.check_for_win(@stored_moves)).to eq(:player_1)
    end

    it 'column 2 win for player 2' do
      self.simulate_win(@stored_moves, '1,2', '2,2', '3,2', 2)
      expect(@gameservice.check_for_win(@stored_moves)).to eq(:player_2)
    end

    it 'column 3 win for player 1' do
      self.simulate_win(@stored_moves, '1,3', '2,3', '3,3', 1)
      expect(@gameservice.check_for_win(@stored_moves)).to eq(:player_1)
    end

    it 'diagonal win for player 2' do
      self.simulate_win(@stored_moves, '1,1', '2,2', '3,3', 2)
      expect(@gameservice.check_for_win(@stored_moves)).to eq(:player_2)
    end

    it 'diagonal win for player 1' do
      self.simulate_win(@stored_moves, '1,3', '2,2', '3,1', 1)
      expect(@gameservice.check_for_win(@stored_moves)).to eq(:player_1)
    end
  end

  describe 'switch player' do
    it 'switches player' do
      expect(@gameservice.switch_player(1)).to eq(2)
      expect(@gameservice.switch_player(2)).to eq(1)
    end
  end

  describe 'same player' do
    it 'returns same player' do
      expect(@gameservice.same_player(1)).to eq(1)
      expect(@gameservice.same_player(2)).to eq(2)
    end
  end

  describe 'check for tie' do
    it 'checks for tie' do
      self.simulate_tie(
        @stored_moves, '1,1', '1,2', '1,3', '2,1',
        '2,2', '2,3', '3,1', '3,2', '3,3'
      )
      expect(@gameservice.check_for_win(@stored_moves)).to eq(:tie)
    end
  end

  describe 'check for valid data' do
    it 'checks that user data is in correct format' do
      expect(@gameservice.user_input_validity_checker('1,3')).to be(true)
      expect(@gameservice.user_input_validity_checker('1,a')).to be(false)
      expect(@gameservice.user_input_validity_checker('a,1')).to be(false)
      expect(@gameservice.user_input_validity_checker('a,a')).to be(false)
      expect(@gameservice.user_input_validity_checker('11')).to be(false)
      expect(@gameservice.user_input_validity_checker('hello')).to be(false)
      expect(@gameservice.user_input_validity_checker('1j,3')).to be(false)
    end
  end

  private def simulate_win(stored_moves, move_1, move_2, move_3, player)
  @gameservice.store_answer(stored_moves, move_1, player)
  @gameservice.store_answer(stored_moves, move_2, player)
  @gameservice.store_answer(stored_moves, move_3, player)
  end

  private def simulate_tie(stored_moves, move_1, move_2, move_3, move_4, move_5, move_6, move_7, move_8, move_9)
    @gameservice.store_answer(stored_moves, move_1, 1)
    @gameservice.store_answer(stored_moves, move_2, 1)
    @gameservice.store_answer(stored_moves, move_3, 2)
    @gameservice.store_answer(stored_moves, move_4, 2)
    @gameservice.store_answer(stored_moves, move_5, 2)
    @gameservice.store_answer(stored_moves, move_6, 1)
    @gameservice.store_answer(stored_moves, move_7, 1)
    @gameservice.store_answer(stored_moves, move_8, 1)
    @gameservice.store_answer(stored_moves, move_9, 2)
  end
end
