require "./tictactoe.rb"
puts "Tic-Tac-Toe".center(35)
puts "Hello, what is your name?"
name = gets.chomp

puts "Hi, #{name}, you will be 'X's"

puts "Who will be O's?"
second_name = gets.chomp

puts "#{name} will be X's, #{second_name} will be O's"
puts "Let's Begin!"

player_1 = Player.new(name, "X")
player_2 = Player.new(second_name, "O")

game = TicTacToe.new
game.setup(player_1, player_2)
puts game.players
puts game.board

puts game.play_game