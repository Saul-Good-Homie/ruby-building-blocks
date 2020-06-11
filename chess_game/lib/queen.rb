require_relative 'empty_piece.rb'
#require_relative 'game.rb'
class Queen < Empty_Piece
    require_relative 'game.rb'

    def initialize(player)
        @piece = "Queen"
        @team = player.team
        @display = set_display(team)
        @master = player.name
        @position = []
        @move_count = 0
    end

    def set_display(team)
        if @team == "Black"
            "[ \u265B ]"
        else
            "[ \u2655 ]"
        end
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
            break if game.board[new_move[0]][new_move[1]].team != "Neutral"
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
                break if game.board[new_move[0]][new_move[1]].team != "Neutral"
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
                    break if game.board[new_move[0]][new_move[1]].team != "Neutral"
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
                        break if game.board[new_move[0]][new_move[1]].team != "Neutral"
                    end
                    i = 1
                    8.times do
                        new_move = []
                        new_move << @position[0] + i
                        new_move << @position[1] 
                            next if new_move[0] < 1 || new_move[0] > 8 || new_move[1] < 1 || new_move[1] > 8 
                        available_moves << new_move
                        i += 1
                        break if game.board[new_move[0]][new_move[1]].team != "Neutral"
                    end
                    
                        j = 1
                        8.times do
                            new_move = []
                            new_move << @position[0]
                            new_move << @position[1] + j
                            next if new_move[0] < 1 || new_move[0] > 8 || new_move[1] < 1 || new_move[1] > 8 
                            available_moves << new_move
                            j += 1
                            break if game.board[new_move[0]][new_move[1]].team != "Neutral"
                        end
            
                            k = -1
                            8.times do
                                new_move = []
                                new_move << @position[0] + k
                                new_move << @position[1] 
                                next if new_move[0] < 1 || new_move[0] > 8 || new_move[1] < 1 || new_move[1] > 8 
                                available_moves << new_move
                                k -= 1
                                break if game.board[new_move[0]][new_move[1]].team != "Neutral"
                            end
            
                                l = -1
                                8.times do
                                    new_move = []
                                    new_move << @position[0]
                                    new_move << @position[1] + l
                                    next if new_move[0] < 1 || new_move[0] > 8 || new_move[1] < 1 || new_move[1] > 8 
                                    available_moves << new_move
                                    l -= 1
                                    break if game.board[new_move[0]][new_move[1]].team != "Neutral"
                                end
            return available_moves
    end

end