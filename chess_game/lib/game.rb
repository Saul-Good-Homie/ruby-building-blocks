require_relative 'players.rb'
require_relative 'game.rb'
require_relative 'knight.rb'
require_relative 'bishop.rb'
require_relative 'rook.rb'
require_relative 'king.rb'
require_relative 'queen.rb'
require_relative 'pawn.rb'

class Chess
    attr_accessor :board, :players


    def initialize
        @board = Array.new(9) {Array.new(9,"[   ]")}
        @players = []
    end

    def set_up(player_1, player_2)
        players << player_1
        players << player_2
    end

    def create_board
        @board[0] = ["[   ]", "[ 1 ]","[ 2 ]","[ 3 ]", "[ 4 ]", "[ 5 ]", "[ 6 ]", "[ 7 ]", "[ 8 ]"]
        n = 1
        j = 0
        alpha = ("A".."H").to_a
        8.times do
            @board[n][0] = "[ #{alpha[j]} ]"
            n += 1
            j += 1
        end
        @board.each do |r|
            puts r.each { |p| p }.join("")
        end
    end

    def print_board
        @board.each do |r|
            puts r.each { |p| p }.join("")
        end
    end

    def update_board(piece, array)
        piece.position = array
        @board[array[0]][array[1]] = piece
    end

    def set_black_pieces(player)
        left_rook = Rook.new(player)
            update_board(left_rook, [1,1])
        right_rook = Rook.new(player)
            update_board(right_rook, [1,8])
                left_knight = Knight.new(player)
                    update_board(left_knight, [1,2])
                right_knight = Knight.new(player)
                    update_board(right_knight, [1,7])
                        left_bishop = Bishop.new(player)
                            update_board(left_bishop, [1,3])
                        right_bishop = Bishop.new(player)
                            update_board(right_bishop, [1,6])
                                king = King.new(player)
                                    update_board(king, [1,4])
                                queen = Queen.new(player)
                                    update_board(queen, [1,5])
                                pawn_1 = Pawn.new(player)
                                    update_board(pawn_1, [2,1])
                                    pawn_2 = Pawn.new(player)
                                        update_board(pawn_2, [2,2])
                                        pawn_3 = Pawn.new(player)
                                            update_board(pawn_3, [2,3])
                                            pawn_4 = Pawn.new(player)
                                                update_board(pawn_4, [2,4])
                                                pawn_5 = Pawn.new(player)
                                                    update_board(pawn_5, [2,5])
                                                    pawn_6 = Pawn.new(player)
                                                        update_board(pawn_6, [2,6])
                                                        pawn_7 = Pawn.new(player)
                                                            update_board(pawn_7, [2,7])
                                                            pawn_8 = Pawn.new(player)
                                                                update_board(pawn_8, [2,8])
            
    end

    def set_white_pieces(player)
        left_rook = Rook.new(player)
            update_board(left_rook, [8,1])
        right_rook = Rook.new(player)
            update_board(right_rook, [8,8])
            left_knight = Knight.new(player)
                update_board(left_knight, [8,2])
            right_knight = Knight.new(player)
                update_board(right_knight, [8,7])
                    left_bishop = Bishop.new(player)
                        update_board(left_bishop, [8,3])
                    right_bishop = Bishop.new(player)
                        update_board(right_bishop, [8,6])
                            king = King.new(player)
                                update_board(king, [8,5])
                            queen = Queen.new(player)
                                update_board(queen, [8,4])
                            pawn_1 = Pawn.new(player)
                                update_board(pawn_1, [7,1])
                                pawn_2 = Pawn.new(player)
                                    update_board(pawn_2, [7,2])
                                    pawn_3 = Pawn.new(player)
                                        update_board(pawn_3, [7,3])
                                        pawn_4 = Pawn.new(player)
                                            update_board(pawn_4, [7,4])
                                            pawn_5 = Pawn.new(player)
                                                update_board(pawn_5, [7,5])
                                                pawn_6 = Pawn.new(player)
                                                    update_board(pawn_6, [7,6])
                                                    pawn_7 = Pawn.new(player)
                                                        update_board(pawn_7, [7,7])
                                                        pawn_8 = Pawn.new(player)
                                                            update_board(pawn_8, [7,8])
    end

    def get_input(player)
        puts "#{player.name} choose a piece you want to move by \n typing a row and column like this: B2"
        piece = gets.chomp
        square = piece.split(//)
        tile = convert_input_to_array(square)
        x = @board[tile[0]][tile[1]]
            if x.team != player.team
                puts "Sorry, please choose a #{player.team} piece"
                get_input(player)
            end

        puts "You chose your #{x.piece}, is this true? Y/N"
            confirm = gets.chomp.upcase!
                if confirm == "Y"
                    x
                else
                    get_input(player)
                end
    end

    def give_movement_options(piece, player, moves)
        if piece.piece == "Pawn"
            give_pawn_movement_options(moves, piece, player)
            return
        end
            possible_moves = []
            moves.each do |move|
                if @board[move[0]][move[1]] == "[   ]"
                    possible_moves << convert_array_to_input(move)
                elsif @board[move[0]][move[1]].team != player.team
                    possible_moves << convert_array_to_input(move)
                end
            end 
            if possible_moves == []
                puts "Sorry, there are no legal moves for this piece. Please choose a different piece."
                puts ""
                self.take_turn(player, self)
                return
            end
                puts "You can move #{piece} to one of these new spots #{possible_moves}"
                    step_one = get_new_position(player, piece, possible_moves)
                        step_two = step_one.split(//)
                            step_three = convert_input_to_array(step_two)
                                move_piece(piece, step_three)
    end

    #the Pawn is the only piece on the board who's movement is relative to the board direction. 
    #So it needs special movement options. 
    def give_pawn_movement_options(moves, piece, player)
        possible_moves = []
        moves.each do |move|
            if move[1] == piece.position[1] && @board[move[0]][move[1]] == "[   ]"
                possible_moves << convert_array_to_input(move)
            elsif move[1] != piece.position[1] && @board[move[0]][move[1]] != "[   ]" && @board[move[0]][move[1]].team != player.team
                possible_moves << convert_array_to_input(move)
            end
        end 
        puts "You can move #{piece} to one of these new spots #{possible_moves}"
            step_one = get_new_position(player, piece, possible_moves)
                step_two = step_one.split(//)
                    step_three = convert_input_to_array(step_two)
                        move_piece(piece, step_three)
    end

    def get_new_position(player, piece, possible_moves)
        puts "#{player.name} choose where you want to move your #{piece} by typing like this: 'B2'"
        step_one = gets.chomp.upcase!
            while !possible_moves.include?(step_one)
                puts "oops, pick a valid square"
                step_one = gets.chomp.upcase!
            end
            puts "Moving #{piece} from #{piece.position} to #{step_one}"
            step_one
    end

    def move_piece(piece, array)
        @board[piece.position[0]][piece.position[1]] = "[   ]"
        piece.position = array
        if piece.piece == "Pawn"
            piece.move_count += 1
        end
        @board[array[0]][array[1]] = piece
    end

    def convert_input_to_array(array)
        board_tile = []
        array[0].upcase!
        case array[0]
        when "A"
            board_tile << 1
        when "B"
            board_tile << 2
        when "C"
            board_tile << 3
        when "D"
            board_tile << 4
        when "E"
            board_tile << 5
        when "F"
            board_tile << 6
        when "G"
            board_tile << 7
        when "H"
            board_tile << 8
        else
            board_tile << 9
        end
        board_tile << array[1].to_i
        board_tile
    end

        def convert_array_to_input(array)
        board_tile = []
        case array[0]
        when 1
            board_tile << "A"
        when 2
            board_tile << "B"
        when 3
            board_tile << "C"
        when 4
            board_tile << "D"
        when 5
            board_tile << "E"
        when 6
            board_tile << "F"
        when 7
            board_tile << "G"
        when 8
            board_tile << "H"
        else
            board_tile << 9
        end
        board_tile << array[1]
        board_tile.join()
    end

    def take_turn(player, game)
        piece = self.get_input(player)
        moves = piece.possible_moves(player, game)
        self.give_movement_options(piece, player, moves)
        self.print_board
    end

    def play_game
        10.times{
            self.take_turn(@players[0], self)
            break if @game_over == true
            self.take_turn(@players[1], self)
            break if @game_over == true
        }  
    end

end