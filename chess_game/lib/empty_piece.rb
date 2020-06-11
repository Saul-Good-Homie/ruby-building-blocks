require_relative 'game.rb'

class Empty_Piece
    attr_accessor :team, :display, :piece, :position, :master, :move_count

    def initialize(player)
        @piece = "empty_piece"
        @team = player.team
        @display = set_display(team)
        @master = player.name
        @position = []
        @move_count = 0
    end

    def set_display(team)        
        "#{"[   ]"}"
    end

    def to_s
        "#{display}"
    end

end