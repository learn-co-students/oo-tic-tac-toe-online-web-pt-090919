require "pry"
class TicTacToe

attr_accessor :board, :index 

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
  ]
          
def initialize
  @board = [
  " ", " ", " ",
  " ", " ", " ",
  " ", " ", " "
  ]
          
end 

def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end 

def input_to_index(input)
  index = input.to_i - 1
end 

def move(index, token = "X")
  @board[index] = token 
end 

def position_taken?(index)
  @board[index] == "X" || @board[index] == "O"
end  

def valid_move?(index)
if position_taken?(index) || index < 0 || index > 8
  false
else 
  true 
  end 
end 

def turn
  puts "Select a position 1-9"
  input = gets  
  index = input_to_index(input)
  if valid_move?(index)
    @board[index] = current_player
    display_board
  else 
    puts "Please enter a valid position"
    turn 
  end 
end 

def turn_count
  @board.count("X") + @board.count("O")
end 

def current_player
  if @board.count("X") > @board.count("O")
    "O"
  else 
    "X"
  end 
end 

def won?
  test_array_x = @board.each_index.select{|i| @board[i] == "X"}
  test_array_o = @board.each_index.select{|i| @board[i] == "O"}
  
  WIN_COMBINATIONS.each do |combos|
    if  (test_array_o & [combos[0], combos[1], combos[2]]).size == 3
    return combos 

    elsif 
    (test_array_x & [combos[0], combos[1], combos[2]]).size == 3
    return combos
    
    else 
     next 
     
    end 
  end 
  false 
end 

def full?
  @board.all?{ |cell| cell == "X" || cell == "O"}
end 
  
def draw?
  if won? || !won? && !full?
    false
  else 
    true 
  end
end 

def over?
  if won? || draw?
    true 
  else 
    false 
  end
end 

def winner 
  if won? && current_player == "O"
    "X"
  elsif 
    won? && current_player == "X"
    "O"
  else 
  nil 
  end 
end 

def play 
  until over? do 
    turn 
  end 
  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
  puts "Cat's Game!"
  end 
end 
  
  

end 
  
          
  
  
          
  