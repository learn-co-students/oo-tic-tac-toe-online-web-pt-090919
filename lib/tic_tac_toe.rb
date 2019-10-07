class TicTacToe
  def initilize(board = nil)
    @board = board || Array.new("","","","","","","","","")
  end

  def current_player
    turn_count % == 0 ? "X": "O"
  end
