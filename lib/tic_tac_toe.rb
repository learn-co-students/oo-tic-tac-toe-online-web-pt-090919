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
    [2, 4, 6] ]
  
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
    position >= 0 && position < 9 && !position_taken?(position)
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
    display_board 
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
  
  def won?
    all_x = []
    all_o = []
    
    @board.each_with_index do |token, index|
      if token == "X"
        all_x << index 
      elsif token == "O"
        all_o << index 
      end 
    end 
    
    WIN_COMBINATIONS.each do |combo| 
      maybe_x = all_x & combo
      maybe_o = all_o & combo
      if maybe_x == combo 
       return maybe_x
      elsif maybe_o == combo 
        return maybe_o
      end 
    end 
    false 
  end 
  
  def full? 
    current_board = []
    @board.each_with_index do |token, index|
      if token == "X" || token == "O"
        current_board << index 
      end 
    end 
    current_board.length == 9
  end 
  
  def draw?
    full? && !won?
  end 
  
  def over? 
    full? && won? || full? && draw?
  end 
  
  def winner 
    if won? 
      winning_combo = won? 
      first_index = winning_combo[0]
      return @board[first_index]
    else 
      nil 
    end 
  end 
  
  def play 
    until over? || won? || draw?
      turn 
    end 
      # see if someone won
      if won? 
    # and declare a winner 
        puts "Congratulations #{winner}!"
    # or see if it's a draw 
      elsif draw? 
        # and declare the draw 
        puts "Cat's Game!"
      end 
    # otherwise ... 
  end 
  
  
end # I END THE CLASS 