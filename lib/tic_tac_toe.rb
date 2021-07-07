class TicTacToe
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
    ]
  attr_accessor :board 
  
  def initialize(board=nil)
   @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end 
  
  def display_board()
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(position)
    index = position.to_i - 1 
  end 
 
  def move(index, token)
    board[index] = token 
  end

  def position_taken?(index)
    !(board[index] == " ")
  end 

  def valid_move?(index)
    index.between?(0, 8) && !position_taken?(index)
  end 

  def turn
    puts "Please enter 1-9:"
     input = gets.strip
     index = input_to_index(input)
     char = current_player
   if valid_move?(index)
      move(index, char)
      display_board
   else
      turn
   end
end

  def turn_count
    turn = 0 
    @board.each do |index|
    if index == "X" || index == "O"
      turn += 1 
  end 
  end 
   return turn 
 end 

def current_player
  if turn_count % 2 == 0
    "X"
  else
    "O"
  end 
end 

  def won?
    a = WIN_COMBINATIONS.find{ |combo| @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X" }
    b = WIN_COMBINATIONS.find{ |combo| @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O" }
    return a || b
  end

  def full?
    @board.all?{|occupied| occupied != " "}
  end 

  def draw?
    !won? && full?
  end

  def over?
    won? || full? || draw?
  end

  def winner
    if won?
      @board[won?[0]] == "X" ? "X" : "O"
    else
      nil
    end
  end

  def play
    while over? == false
    turn
  end
  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cat's Game!"
  end
end

end 

