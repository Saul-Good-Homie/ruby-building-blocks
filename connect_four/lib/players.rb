class Player
    attr_accessor :name, :team

    def initialize(name, team)
        @name = name
        @team = team
    end

    def to_s
        "#{@name}: #{@team}"
    end
    
end