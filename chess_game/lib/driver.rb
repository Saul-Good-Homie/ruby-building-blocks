require_relative 'game.rb'

# game = Chess.new
        # puts "Hello Friend, let's play a game of Chess"
        # puts ""
        # puts "What is your name?"
        # name = gets.chomp
        # player_1 = Player.new(name, "Black")
        # puts "Great! #{player_1.name} will be #{player_1.team}"
        # puts ""

        # puts "Now we need an opponent"
        # puts ""
        # puts "Who are you playing?"
        # second_name = gets.chomp
        # player_2 = Player.new(second_name, "White" )
        # puts "#{player_2.name} will be #{player_2.team}."
        # puts ""
        # puts "Now lets play!"
        # puts ""

game = Chess.new

player_1 = Player.new("Saul", "Black")
player_2 = Player.new("LJ", "White")
game.set_up(player_1, player_2)
game.create_board
puts ""

game.set_black_pieces(player_1)
game.set_white_pieces(player_2)
game.print_board

game.play_game



