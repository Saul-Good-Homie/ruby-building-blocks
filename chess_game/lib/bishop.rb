class Bishop
    require_relative 'game.rb'
    attr_accessor :team, :display, :piece, :position, :master

    def initialize(player)
        @piece = "Bishop"
        @team = player.team
        @display = set_display(team)
        @master = player.name
        @position = []
    end

    def set_display(team)
        if @team == "Black"
            "[ \u265D ]"
        else
            "[ \u2657 ]"
        end
    end

    def to_s
        "#{display}"
    end

    def possible_moves(player, game)
        available_moves = []
        a = 1
        b = 1
        8.times do
            new_move = []
            new_move << @position[0] + a
            new_move << @position[1] + b
            next if new_move[0] < 1 || new_move[0] > 8 || new_move[1] < 1 || new_move[1] > 8 
            available_moves << new_move
            a += 1
            b += 1
            break if game.board[new_move[0]][new_move[1]] != "[   ]"
        end
        
            c = -1
            d = -1
            8.times do
                new_move = []
                new_move << @position[0] + c
                new_move << @position[1] + d
                next if new_move[0] < 1 || new_move[0] > 8 || new_move[1] < 1 || new_move[1] > 8 
                available_moves << new_move
                c -= 1
                d -= 1
                break if game.board[new_move[0]][new_move[1]] != "[   ]"
            end
                e = 1
                f = -1
                8.times do
                    new_move = []
                    new_move << @position[0] + e
                    new_move << @position[1] + f
                    next if new_move[0] < 1 || new_move[0] > 8 || new_move[1] < 1 || new_move[1] > 8 
                    available_moves << new_move
                    e += 1
                    f -= 1
                    break if game.board[new_move[0]][new_move[1]] != "[   ]"
                end
                    g = -1
                    h = 1
                    8.times do
                        new_move = []
                        new_move << @position[0] + g
                        new_move << @position[1] + h
                        next if new_move[0] < 1 || new_move[0] > 8 || new_move[1] < 1 || new_move[1] > 8 
                        available_moves << new_move
                        g -= 1
                        h += 1
                        break if game.board[new_move[0]][new_move[1]] != "[   ]"
                    end
                    
            # available_moves.filter! do |pos|
            #     pos[0] >= 1 && pos[0] <= 8 && pos[1] >= 1 && pos[1] <= 8
            # end    
            return available_moves
    end




end