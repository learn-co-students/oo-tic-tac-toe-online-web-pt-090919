class TicTacToe
  
  
  def initialize
    @board = Array.new(9, " ")
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
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(input)
    input.to_i-1
  end
  
  def move(index, token = "X")
    @board[index] = token
  end
  
  def position_taken?(index)
    if @board[index] == " "
      false
    else true
    end
  end
  
  def valid_move?(index)
    if position_taken?(index) || index < 0 || index > 8
      false
    else true
    end
  end
  
  def turn_count
    turn_count = 0
    @board.each do |position|
      if position != " "
        turn_count += 1
      end
    end
    turn_count
  end
  
  def current_player
    if turn_count%2 == 0
      player = "X"
    else player = "O"
    end
  end

  def turn
    puts "Please input your desired position."
    choice = gets
    index = input_to_index(choice)
    if valid_move?(index) == true
      @board[index] = current_player
      display_board
    else 
      puts "Invalid move. Input a number between 1 and 9."
      turn
    end
  end

  def won?
  WIN_COMBINATIONS.each do |combination|
      if @board[combination[0]] == "X" && @board[combination[1]] == "X" && @board[combination[2]] == "X"
        @winner = "X"
        return combination
      elsif @board[combination[0]] == "O" && @board[combination[1]] == "O" && @board[combination[2]] == "O"
        @winner = "O"
        return combination
      end
    end
    return false
  end

  def full?
    @board.each do |token|
      if token != "X" && token != "O"
        return false
      end
    end
    true
  end

  def draw?
    full? == true && won? == false
  end
  
  def over?
    if won? != false || draw? == true
      return true
    end
   false
  end
  
  def winner
    if won? != false && turn_count.odd? == true
      return "X"
    elsif won? != false && turn_count.even? == true
      return "O"
    end
    nil
  end
  
  def play
    while over? == false
      turn
    end
    if won? != false
      puts "Congratulations #{winner}!"
    elsif draw? == true
      puts "Cat's Game!"
    end
  end
  
end