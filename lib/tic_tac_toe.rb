class TicTacToe
  
WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [6, 4, 2]
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


#coverts input to an integer
def input_to_index(user_input)
  index = user_input.to_i
  index -= 1
  return index
end

def move(index, current_player = "X")
  @board[index] = current_player
end

def position_taken?(index)
  !(@board[index].nil? || @board[index] == " ")
end

def valid_move?(index)
  index.between?(0,8) && !position_taken?(@board, index)
end

def turn_count
  counter = 0
  @board.each do |i|
    if i == "X" || i == "O"
      counter += 1
    end
  end
 # puts counter
  return counter.to_i
end


def current_player
    #  turn_count(board) % 2 == 0 ? "X" : "O"
    turn_count(@board).to_i.even? == true ? "X" : "O"
end


def turn
  puts "Please choose a number 1-9:"
  user_input = gets.chomp
  
  index = input_to_index(user_input)
  
  if valid_move?(index)
    player_token = current_player(@board)
    move(@board, index, player_token)
    display_board(@board)
  else
    puts "That selection is not valid. Please choose a different number 1-9:"
    turn(board) #recursive
  end
end

def won?(board)
  WIN_COMBINATIONS.each {|win_combo|
    index_0 = win_combo[0]
    index_1 = win_combo[1]
    index_2 = win_combo[2]

    position_1 = board[index_0]
    position_2 = board[index_1]
    position_3 = board[index_2]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combo
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combo
    end
  }
  return false
end

def full?(board)
  board.all? {|index| index == "X" || index == "O"}
end

def draw?(board)
  if !won?(board) && full?(board)
    return true
  else
    return false
  end
end

def over?(board)
  if won?(board) || draw?(board)
    return true
  else
    return false
  end
end

def winner (board)
  index = []
  index = won?(board)
  if index == false
    return nil
  else
    if board[index[0]] == "X"
      return "X"
    else
      return "O"
    end
  end
end

def play(board)
  until over?(board) == true
    turn(board)
  end

  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end
end #end class TicTacToe


=begin
puts "Welcome to Tic Tac Toe!"
board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

display_board(board)
play(board)
=end