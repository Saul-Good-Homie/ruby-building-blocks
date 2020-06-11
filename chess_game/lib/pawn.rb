require_relative 'empty_piece.rb'
require_relative 'game.rb'
class Pawn < Empty_Piece

    def initialize(player)
        @piece = "Pawn"
        @team = player.team
        @display = set_display(team)
        @master = player.name
        @position = []
        @move_count = 0
    end

    def set_display(team)
        if @team == "Black"
            "[ \u265F ]"
        else
            "[ \u2659 ]"
        end
    end

    def possible_moves(player, game)
        if @team == "Black"
            movement = [[1,0],[1,1],[1,-1]]
                if @move_count == 0 && game.board[@position[0]+1][@position[1]].team == "Neutral"
                    movement << [2,0]
                end
        else
                movement = [[-1,0],[-1,1],[-1,-1]]
                if @move_count == 0 && game.board[@position[0]-1][@position[1]].team == "Neutral"
                    movement << [-2,0]
                end
        end
        available_moves = []
        movement.each { |move|
            new_move = []
            new_move << move[0] + @position[0]
            new_move << move[1] + @position[1]
                #skip if the move is out of bounds.
            next if new_move[0] < 1 || new_move[0] > 8 || new_move[1] < 1 || new_move[1] > 8
                #skip if not within game board boundaries (A-G or 1-9)
            next if game.board[new_move[0]][new_move[1]].class == String
                #skip if the move is vertical and the space is NOT empty
            next if new_move[1] == @position[1] && game.board[new_move[0]][new_move[1]].team != "Neutral"
                #skip if the move is diagonal and the space IS empty or IS same team
            next if new_move[1] != @position[1] && game.board[new_move[0]][new_move[1]].team == "Neutral" 
            #next if new_move[1] != @position[1] && game.board[new_move[0]][new_move[1]].team == player.team 
            
            available_moves << new_move
        }
        return available_moves
    end

end