class Pawn
    attr_accessor :team, :display, :piece, :position, :master, :move_count
    #@@moves = [1,0]

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

    def to_s
        "#{display}"
    end

    def possible_moves(player, game)
        if @team == "Black"
            movement = [[1,0],[1,1],[1,-1]]
                if @move_count == 0
                    movement << [2,0]
                end
        else
                movement = [[-1,0],[-1,1],[-1,-1]]
                if @move_count == 0
                    movement << [-2,0]
                end
        end
        available_moves = []
        movement.each { |move|
            new_move = []
            new_move << move[0] + @position[0]
            new_move << move[1] + @position[1]
            available_moves << new_move
        }
        available_moves.filter! do |pos|
            pos[0] >= 1 && pos[0] <= 8 && pos[1] >= 1 && pos[1] <= 8
        end    
        available_moves
    end

end