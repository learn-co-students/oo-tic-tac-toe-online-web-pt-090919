class TicTacToe
  
  WIN_COMBINATIONS = [
    [0,1,2],[3,4,5],[6,7,8],
    [0,3,6],[1,4,7],[2,5,8],
    [0,4,8],[2,4,6]
   ]                   
  
  def initialize()
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end 
  
  def display_board
    puts "-----------"
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end 
  
  def input_to_index(input)
    input.to_i-1
  end 
    
  def move(input, token = "X")
    @board[input] = token 
  end 
  
  def position_taken?(position)
    return false if @board[position] == " "
    true 
  end 
  
  def valid_move?(position)
    return false unless (0..8).include?(position)
    not position_taken?(position)
  end 
  
  def turn_count
    turn = 0 
    @board.each {|position| turn += 1 unless position == " "}
    turn
  end 
  
  def current_player 
    if turn_count%2 == 0 
      "X"
    else
      "O"
    end 
  end 
  
  def previous_player
    if turn_count%2 == 0 
      "O"
    else
      "X"
    end 
  end 
  
  
  def turn 
    puts "MAKE YOUR MARK"
    attack = gets.strip
    strike = input_to_index(attack)
    if valid_move?(strike)
      move(strike, current_player)
      display_board
    else 
      puts "THAT SQUARE IS ALREADY TAKEN"
      turn 
    end 
  end 
  
  
  def won?
      exes = @board.map.with_index  { |position, index| index if position == "X" }
      xxx = WIN_COMBINATIONS.find { |combo| (combo - exes).empty? }
     return xxx if xxx
      owes = @board.map.with_index { |position, index| index if position == "O" }
      ooo = WIN_COMBINATIONS.find { |combo| (combo - owes).empty? }
     return ooo if ooo
     false
   end
   
   def full?
     true if turn_count == 9
   end 
   
   def draw?
     return true if full? && !won?
   end 
   
   
   def over?
     true if draw? || won?
   end 
   
   def winner
     previous_player if won?
   end 
   
   def play 
     turn until over?
     puts "Congratulations #{winner}!" if won?
     puts "Cat's Game!" if draw?
   end 
   
  
  end 
