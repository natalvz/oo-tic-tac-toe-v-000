class TicTacToe
  def initialize(board = [" "," "," "," "," "," "," "," "," "])
    @board =  board
  end
  WIN_COMBINATIONS =
  [
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
  index = input.to_i - 1
end

def move(index, player_token)
  @board[index] = player_token
end
 
 def position_taken?(index)
   if @board[index] == "X" || @board[index] == "O"
     true
   else
     false
   end
 end
 
 def valid_move?(index)
 if index.between?(0, 8) && position_taken?(index) == false
   true
   else
     false
   end
 end
 
 def turn
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(index)
    move(index, current_player)
    display_board
  else 
    turn
  end
end

 def turn_count
   counter = 0
   @board.each do |element|
     if element == "X" || element == "O"
       counter += 1 
       end
     end
       return counter
     end
 
 def current_player
   turn_count.even? ? "X" : "O"
 end
 
 def won?
   WIN_COMBINATIONS.detect do |win_combination|
     win_index_1 = win_combination[0]
     win_index_2 = win_combination[1]
     win_index_3 = win_combination[2]
     
     position_1 = @board[win_index_1]
     position_2 = @board[win_index_2]
     position_3 = @board[win_index_3]
     
     position_not_taken = position_taken?(win_index_1) && position_taken?(win_index_2) && position_taken?(win_index_3)
     
     position_1 == position_2 && position_2 == position_3 && position_not_taken
     end
end

def full?
   @board.all? {|cell| cell == "X" || cell == "O"}
 end
 
 def draw?
   !won? && full?
 end
 
 def over?
   if won? || draw? || full?
    return true
  else
    return false
  end
end

def winner
if !won?.nil?
  @board[won?[0]]
  end
  end
  
def play 
  while !over?
  turn
  end
if won?
  if winner == "X"
    return puts "Congratulations X!"
  else 
    return puts "Congratulations O!"
  end
else draw?
  puts "Cat's Game!"
end
end

end
