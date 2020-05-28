require_relative 'game.rb'

game = Chess.new
        puts "Hello Friend, let's play a game of Chess"
        puts ""
        puts "What is your name?"
        name = gets.chomp
        player_1 = Player.new(name, "Black")
        puts "Great! #{player_1.name} will be #{player_1.team}"
        puts ""

        puts "Now we need an opponent"
        puts ""
        puts "Who are you playing?"
        second_name = gets.chomp
        player_2 = Player.new(second_name, "White" )
        puts "#{player_2.name} will be #{player_2.team}."
        puts ""
        puts "Now lets play!"
        puts ""

# game.print_board
# game.set_up(player_1, player_2)
# game.play_game