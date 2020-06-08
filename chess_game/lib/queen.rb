class Queen
    attr_accessor :name, :team, :display

    def initialize(player)
        @team = player.team
        @display = set_display(team)
        @master = player.name
    end

    def set_display(team)
        if @team == "Black"
            "[ \u265B ]"
        else
            "[ \u2655 ]"
        end
    end
    
    def to_s
        "[#{display}]"
    end

end