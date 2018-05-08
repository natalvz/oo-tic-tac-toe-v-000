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
    return move(index, current_player
    display_board
  else turn
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
     
end
