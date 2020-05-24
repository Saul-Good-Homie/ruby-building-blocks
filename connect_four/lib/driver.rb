require_relative 'connect_four.rb'

game = Connect_Four.new
        puts "Hello Friend, let's play Connect Four"
        puts ""
        puts "What is your name?"
        name = gets.chomp
        player_1 = Player.new(name, "\u25CF")
        puts "Great! #{player_1.name} will be Black #{player_1.team}"
        puts ""

        puts "Now we need an opponent"
        puts ""
        puts "Who are you playing?"
        second_name = gets.chomp
        player_2 = Player.new(second_name, "\u25CB" )
        puts "#{player_2.name} will be white #{player_2.team}."
        puts ""
        puts "Now lets play!"
        puts ""

game.print_board
game.set_up(player_1, player_2)
game.play_game


