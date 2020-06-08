class Knight
    attr_accessor :team, :display, :piece, :position, :master
    @@moves = [[1,2],[1,-2],[2,1],[2,-1],[-1,2],[-1,-2],[-2,1],[-2,-1]]

    def initialize(player)
        @piece = "Knight"
        @team = player.team
        @display = set_display(team)
        @master = player.name
        @position = []
    end

    def set_display(team)
        if @team == "Black"
            "[ \u265E ]"
        else
            "[ \u2658 ]"
        end
    end

    def to_s
        "#{display}"
    end

    def possible_moves(player, game)
        available_moves = []
        @@moves.each { |move|
            new_move = []
            new_move << move[0] + @position[0]
            new_move << move[1] + @position[1]
            available_moves << new_move
        }
        available_moves.filter! do |pos|
            pos[0] >= 1 && pos[0] <= 8 && pos[1] >= 1 && pos[1] <= 8
        end    
    end



end