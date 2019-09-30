require "pry"

class TicTacToe
  
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
    @board = Array.new(9, " ")
  end
  
  def display_board 
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(user_input) 
    user_input = user_input.to_i - 1
  end
  
  def move(index_choice, token='X') 
    @board[index_choice] = token
  end
  
  def position_taken?(position)
    @board[position] == 'X' || @board[position] == 'O'
  end
  
  def valid_move?(position)
    !position_taken?(position) && position.between?(0,8) ? true : false
  end
  
  def turn 
    puts "Choose a position between 1-9 on the board"
    user_input = gets
    check_move = input_to_index(user_input)
    if valid_move?(check_move)
      move(check_move, current_player)
    else 
      turn
    end
    display_board
  end
  
  def turn_count
    count = 0
    @board.each do |pos|
      if pos == 'X' || pos == 'O'
        count += 1
      end
    end
    count
  end
  
  def current_player
    turn_count % 2 == 0 ? 'X':'O'
  end
  
  def won? 
    board_empty = @board.none? { |i| i == "X" || i = "O"}
    if board_empty
      false
    else 
      WIN_COMBINATIONS.each do |combo| 
        if @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X" || @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
          return combo
        end
      end
      return false
    end
  end
  
  def full?
    @board.all? { |i| i =="X" || i == "O"}
  end
  
  def draw? 
    !won? && full? ? true: false
  end
  
  def over? 
    won? || draw? || full? ? true: false 
  end 
  
  def winner 
    WIN_COMBINATIONS.detect do |combo| 
          if @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X" 
            return "X"
          elsif @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
            return "O"
          else 
            nil
          end
    end
  end
  
  def play
    until over?
      turn
    end

    if won? 
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
  
end









