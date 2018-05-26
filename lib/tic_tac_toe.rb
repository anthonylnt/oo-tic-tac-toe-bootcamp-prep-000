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
  !(@board[index] ==  " " || @board[index] == nil)
  end
  
  def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
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
  
  def turn 
    puts "Enter your position (1-9):"
    user_input = gets.strip
    index = input_to_index(user_input)
    valid_move?(index) ? move(index, value = current_player) && display_board : turn
  end
  
  def won?
    WIN_COMBINATIONS.find { |win| @board[win[0]] == @board[win[1]] && @board[win[1]] == @board[win[2]] && position_taken?(win[0])}
  end
  
  def full?
    return @board.all? { |value| value == "X" || value == "O"}
  end
  
  def draw?
    full? && !won?
  end
  
  def over?
    won? || full?
  end
  
  def winner
    if winning_combo = won?
      @board[winning_combo.first]
    end
  end
end