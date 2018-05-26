class TicTacToe 
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
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
  
  def input_to_index(user_input)
    user_input.to_i - 1
  end
  
  def move(index, player_token = "X")
    @board[index] = player_token
  end
  
  def position_taken?(index)
    @board[index] != " " ? true : false
  end
  
  def valid_move?(index)
    @board[index] && !position_taken?(index) ? true : (false || nil)
  end
  
  def turn
    puts "Enter your position (1-9)"
    index = gets.strip
    input_to_index(index)
    valid_move?(index) ? move(index) : turn
  end
  
  def turn_count
    @board.count {|x| x == "X" || x == "O" }
  end
  
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
end