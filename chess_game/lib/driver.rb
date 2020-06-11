require_relative 'game.rb'

game = Chess.new
game.create_players

# player_1 = Player.new("Saul", "Black")
# player_2 = Player.new("LJ", "White")

#game.set_up(player_1, player_2, game_manager)
game.create_board
puts ""
game.set_game_pieces
game.print_board

game.play_game



