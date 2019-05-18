WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end


def input_to_index(input)
  input.to_i - 1
end

def move(board, index, character="X")
  board[index] = character
end

def position_taken?(board, index)
  board[index] != " "
end

def valid_move?(board, index)
  index.between?(0, 8) && !position_taken?
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.chomp!
  index = input_to_index(input)
  move(board, index, current_player(board))
end

def turn_count(board)
  board.count{|space| space != " " }
end

def current_player(board)
  turn_count(board).even? ?  "X" :  "O"
end

def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    position_taken?(board, combo[0]) && 
    board[combo[0]] == board[combo[1]] &&
    board[combo[1] == board[combo[2]]
  end
end

def full?(board)
  board.all?{|space| space != " "}
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  draw?(board) || won?(board)
end

def winner(board)
  if won?(board)
    board[won?(board)[0]]
  end
end