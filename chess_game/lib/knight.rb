require_relative 'empty_piece.rb'
#require_relative 'game.rb'

class Knight < Empty_Piece
    @@moves = [[1,2],[1,-2],[2,1],[2,-1],[-1,2],[-1,-2],[-2,1],[-2,-1]]

    def initialize(player)
        @piece = "Knight"
        @team = player.team
        @display = set_display(team)
        @master = player.name
        @position = []
        @move_count = 0
    end

    def set_display(team)
        if @team == "Black"
            "[ \u265E ]"
        else
            "[ \u2658 ]"
        end
    end

    def possible_moves(player, game)
        available_moves = []
        @@moves.each { |move|
            new_move = []
            new_move << move[0] + @position[0]
            new_move << move[1] + @position[1]
            next if new_move[0] < 1 || new_move[0] > 8 || new_move[1] < 1 || new_move[1] > 8 
            available_moves << new_move
        }
        return available_moves
    end



end