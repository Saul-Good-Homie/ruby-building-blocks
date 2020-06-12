require_relative 'players.rb'
require_relative 'game.rb'
require_relative 'knight.rb'
require_relative 'bishop.rb'
require_relative 'rook.rb'
require_relative 'king.rb'
require_relative 'queen.rb'
require_relative 'pawn.rb'
require_relative 'empty_piece.rb'

class Chess
    attr_accessor :board, :players


    def initialize
        @players = []
        @board = []
        @check = false
        @checkmate = false
        @last_move = []
    end
    
    def create_players
        # game_manager = Player.new("Admin", "Neutral")
        # puts "Hello Friend, let's play a game of Chess"
        # puts ""
        # puts "What is your name?"
        # name = gets.chomp
        # player_1 = Player.new(name, "Black")
        # puts "Great! #{player_1.name} will be #{player_1.team}"
        # puts ""

        # puts "Now we need an opponent"
        # puts ""
        # puts "Who are you playing?"
        # second_name = gets.chomp
        # player_2 = Player.new(second_name, "White" )
        # puts "#{player_2.name} will be #{player_2.team}."
        # puts ""
        # puts "Now lets play!"
        # puts ""

player_1 = Player.new("Saul", "Black")
player_2 = Player.new("LJ", "White")
game_manager = Player.new("Admin", "Neutral")

            #add players to array
            @players << player_1
            @players << player_2
            @players << game_manager
    end

    def create_board
        #create board full of empty pieces
        @board = Array.new(9) {Array.new(9, Empty_Piece.new(@players[2]))}

        #set top row to numbers
            i = 1
            8.times do   
                @board[0][i] = "[ #{i} ]"
                i += 1
            end

        #set first column to Letters
            n = 1
            j = 0
            alpha = ("A".."H").to_a
            8.times do
                @board[n][0] = "[ #{alpha[j]} ]"
                n += 1
                j += 1
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


    def set_game_pieces
        set_black_pieces(@players[0])
        set_white_pieces(@players[1])
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
                                    #update_board(king, [5,6])
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
                                #update_board(king, [8,5])
                                update_board(king, [4,5])
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
            possible_moves = []
            moves.each do |move|
                next if @board[move[0]][move[1]].class == String
                if @board[move[0]][move[1]].team == "Neutral"
                    possible_moves << convert_array_to_input(move)
                    next
                end
                if @board[move[0]][move[1]].team != player.team
                    possible_moves << convert_array_to_input(move)
                    next
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

    def get_new_position(player, piece, possible_moves)
        puts "#{player.name} choose where you want to move your #{piece} by typing like this: 'B2'"
        step_one = gets.chomp.upcase!
            while !possible_moves.include?(step_one)
                puts "oops, pick a valid square"
                step_one = gets.chomp.upcase!
            end
            puts "Moving #{piece} from #{convert_array_to_input(piece.position)} to #{step_one}"
            step_one
    end

    def move_piece(piece, array)
        @last_move = piece.position
        @board[piece.position[0]][piece.position[1]] = Empty_Piece.new(@players[2])
        piece.position = array
        piece.move_count += 1
        @board[array[0]][array[1]] = piece
    end

    def undo_move(piece)
        @board[piece.position[0]][piece.position[1]] = Empty_Piece.new(@players[2])
        piece.position = @last_move
        piece.move_count -= 1
        @board[@last_move[0]][@last_move[1]] = piece
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


    def find_king(player, game)
        @board.each do |row|
            row.each do |square|
                next if square.class == String
                next if square.team == "Neutral"
                if square.piece == "King" && square.team == player.team
                    return square
                end
            end
        end
    end

    def king_in_check(player, game)
        king = find_king(player, game)
        #find all possible moves to reach the king
        @board.each do |row|
            row.each do |square|
                next if square.class == String
                next if square.team == "Neutral"
                next if square.team == player.team
                moves = square.possible_moves(player, game)
                    if moves.include?(king.position)
                        puts "*****CHECK!*****"
                        puts ""
                        puts "#{player.name}, your #{king.display} is in check from #{convert_array_to_input(square.position)}"
                        @check = true
                    else 
                        @check = false
                    end
            end    
        end
    end

    def king_still_in_check(player, game)
        king = find_king(player, game)
        #find all possible moves to reach the king
        @board.each do |row|
            row.each do |square|
                next if square.class == String
                next if square.team == "Neutral"
                next if square.team == player.team
                moves = square.possible_moves(player, game)
                    if moves.include?(king.position)
                        @check = true
                    else 
                        @check = false
                    end
            end    
        end
    end


    def take_turn(player, game)
        #self.check_mate(player, game)
        self.king_in_check(player, game)
        piece = self.get_input(player)
        moves = piece.possible_moves(player, game)
        self.give_movement_options(piece, player, moves)
            self.king_still_in_check(player, game)
            if @check == true
                puts "Sorry, you need to make a move to take your King out of Check"
                puts ""
                undo_move(piece)
                take_turn(player, game)
            end
        self.print_board
    end

    def play_game
        10.times{
            self.take_turn(@players[0], self)
            break if @checkmate == true
            self.take_turn(@players[1], self)
            break if @checkmate == true
        }  
    end

end