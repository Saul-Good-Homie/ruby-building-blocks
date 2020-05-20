require_relative 'knight_moves.rb'

chess = Knight_Moves.new
chess.print_board
puts ""
chess.knight_moves([3,3],[3,4])

puts ""
chess.knight_moves([3,3],[0,0])

puts ""
chess.knight_moves([1,2],[6,6])