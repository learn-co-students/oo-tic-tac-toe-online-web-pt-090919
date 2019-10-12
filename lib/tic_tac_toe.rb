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
  
  def input_to_index(user_input_move)
    if user_input_move != 0
        user_input_move.to_i - 1
    else 
      user_input_move
    end
  end
  
  def move(user_input_move, player_token)
    @board[user_input_move] = player_token
  end
  
  def position_taken?(user_input_move)
     @board[user_input_move] == "X" || @board[user_input_move] == "O"
  end
  
  def valid_move?(user_input_move)
    user_input_move >= 0 && user_input_move < 9 && !position_taken?(user_input_move)
  end

  def turn
    puts "Choose your move? (1-9)"
    user_move = gets.chomp
    user_input_move = input_to_index(user_move)
      if valid_move?(user_input_move) && !position_taken?(user_input_move)
        move(user_input_move, current_player)
      else
        puts "Sorry that move is taken. Try again?"
        turn
      end
      display_board
  end
  
  def turn_count
    count = 0
    @board.each do |num_turn|
      if num_turn == "X" || num_turn == "O"
        count += 1
      end
    end
    count
  end
  
  def current_player
    if turn_count.even?
      "X"
    else
      "O"
    end
  end
  
  def won?
    x_moves = []
    o_moves = []
    
    @board.each_with_index do |player, index|
      if player == "X"
        x_moves << index 
      elsif player == "O"
        o_moves << index 
      end 
    end 
    
    WIN_COMBINATIONS.each do |win| 
      x_win = x_moves & win
      o_win = o_moves & win
      if x_win == win
       return x_win
      elsif o_win == win
        return o_win
      end 
    end 
    false 
  end
  
  def full?
    full_board = []
    @board.each_with_index do |player, index|
      if player == "X" || player == "O"
        full_board << index
      end
    end
    full_board.length == 9
  end
  
  def draw?
   full? == true && won? == false
      #return true
    # elsif won? == true
    #   return false  
    # else full? == false && won? == false
    #   return false
    #end
  end
  
  def over?
    won? == true || full? == true
  end
  
  def winner
    if won? 
      win = won? 
      index = win[0]
      return @board[index]
    else 
      nil 
    end
  end
  
  def play
    until over? || won? || draw?
        turn 
      end 
        if won?
          puts "Congratulations #{winner}!"
        else draw? 
          puts "Cat's Game!"
        end 
  end
end