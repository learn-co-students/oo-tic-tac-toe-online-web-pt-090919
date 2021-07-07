class TicTacToe
  
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]
  
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
 
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
 
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
 
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    x = input.to_i
    x = x - 1
    x
  end
  
  def move(index, token = "X")
    @board[index] = token
  end
  
  def position_taken?(index)
    if @board[index] == " "
      false
    else
      true
    end
  end

  def valid_move?(index)
    return false unless (0..8).include?(index)
    not position_taken?(index)
  end

def full?
  @board.all? do |x|
    if x=="X" || x=="O"
      true
    else
      false
    end
  end
end

def turn
  x = gets.strip
  y = input_to_index(x)
  if valid_move?(y)
    move(y,current_player)
    display_board
  else
    turn
  end
end

def won?
  x = @board.map.with_index {|a,b| b if a == "X"}
  if WIN_COMBINATIONS.any? {|c| (c-x).empty?}
    return WIN_COMBINATIONS.find {|c| (c-x).empty?}
  end
  y = @board.map.with_index {|a,b| b if a == "O"}
  if WIN_COMBINATIONS.any? {|c| (c-y).empty?}
    return WIN_COMBINATIONS.find {|c| (c-y).empty?}
  end
  false
end

def draw?
  if full? && !won?
    true
  elsif won?
    false
  elsif !won? && !full?
    false
  end
end

def over?
  if won? || draw?
    true
  end
end

def winner
  if won?
    if current_player == "O"
      return "X"
      elsif current_player == "X"
      return "O"
    end
  end
end

def play
  turn until over?
  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cat's Game!"
  end
end

end