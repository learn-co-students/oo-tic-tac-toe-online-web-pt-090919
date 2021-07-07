require 'pry'

class TicTacToe
  attr_accessor :board

  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
#    board
  end

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

def display_board
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  index = input.to_i - 1
  index
end

def move(index, player)
  @board[index] = player
end

def position_taken?(index)
  if @board[index] == "" || @board[index] == " " || @board[index] == nil
    return false
  else
    return true
  end
end

def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
  # (0..8).covers?(index)
end

def turn
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(index)
    move(index, player = current_player)
    display_board
  else
    turn
  end
end

def turn_count
  board.count("X") + board.count("O")
end

def current_player
  if turn_count.even?
    return "X"
  else
    return "O"
  end
end

def won?
  WIN_COMBINATIONS.any? do |combo|
    if position_taken?(combo[0]) && @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]]
      return combo
    end
end
# false
end

def full?
  @board.all? {|e| e != " "}
end

def draw?
  full? && !won?
end

def over?
  full? || draw? || won?
end

def winner
  if won? && turn_count.even?
    return "O"
  end
    if won? && turn_count.odd?
      return "X"
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
