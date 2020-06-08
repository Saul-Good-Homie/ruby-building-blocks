class Rook
    require_relative 'game.rb'
    attr_accessor :team, :display, :piece, :position, :master

    def initialize(player)
        @piece = "Rook"
        @team = player.team
        @display = set_display(team)
        @master = player.name
        @position = []
    end

    def set_display(team)
        if @team == "Black"
            "[ \u265C ]"
        else
            "[ \u2656 ]"
        end
    end

    def to_s
        "#{display}"
    end

    def possible_moves(player, game)
        available_moves = []
        n = 1
        8.times do
            new_move = []
            new_move << @position[0] + n
            new_move << @position[1] 
                next if new_move[0] < 1 || new_move[0] > 8 || new_move[1] < 1 || new_move[1] > 8 
            available_moves << new_move
            n += 1
            break if game.board[new_move[0]][new_move[1]] != "[   ]"
        end
        
            j = 1
            8.times do
                new_move = []
                new_move << @position[0]
                new_move << @position[1] + j
                next if new_move[0] < 1 || new_move[0] > 8 || new_move[1] < 1 || new_move[1] > 8 
                available_moves << new_move
                j += 1
                break if game.board[new_move[0]][new_move[1]] != "[   ]"
            end

                k = -1
                8.times do
                    new_move = []
                    new_move << @position[0] + k
                    new_move << @position[1] 
                    next if new_move[0] < 1 || new_move[0] > 8 || new_move[1] < 1 || new_move[1] > 8 
                    available_moves << new_move
                    k -= 1
                    break if game.board[new_move[0]][new_move[1]] != "[   ]"
                end

                    i = -1
                    8.times do
                        new_move = []
                        new_move << @position[0]
                        new_move << @position[1] + i
                        next if new_move[0] < 1 || new_move[0] > 8 || new_move[1] < 1 || new_move[1] > 8 
                        available_moves << new_move
                        i -= 1
                        break if game.board[new_move[0]][new_move[1]] != "[   ]"
                    end
        return available_moves
    end


end