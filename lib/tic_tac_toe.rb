require "pry"
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
  
  def initialize 
    @board = Array.new(9, " ")
  end 
  
  def display_board 
    p " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    p "-----------"
    p " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    p "-----------"
    p " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end 
  
  def input_to_index(user_input)
    if user_input == 0 
      position = 0 
    else 
      position = user_input.to_i - 1 
    end 
    position 
  end 
  
  def move(position, token ="X")
    @board[position] = token
  end 
  
  def position_taken?(position)
    @board[position].include?("X") || @board[position].include?("O")
  end 
  
  def valid_move?(position)
    position < 9 && !position_taken?(position)
  end 
  
  def turn
    puts "Choose a cell (1 - 9)"
    
    user_input = gets.chomp 
    
    position = input_to_index(user_input)
    
    if valid_move?(position)  
      move(position, current_player)
    else 
      puts "invalid"
      turn
    end 
    
   puts display_board 
    
  end 
  
  def turn_count 
    turns = 0 
    @board.length.times do |x| 
      if @board[x].include?("X") || @board[x].include?("O")
        turns += 1 
      end 
    end 
    turns 
  end 
  
  def current_player 
    if turn_count % 2 == 0 
      "X"
    else 
      "O"
    end 
  end 
  
end 