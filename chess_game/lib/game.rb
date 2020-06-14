require_relative 'players.rb'
require_relative 'game.rb'
require_relative 'knight.rb'
require_relative 'bishop.rb'
require_relative 'rook.rb'
require_relative 'king.rb'
require_relative 'queen.rb'
require_relative 'pawn.rb'
require_relative 'empty_piece.rb'

require 'yaml'
class Chess
    attr_accessor :board, :players

@@total_moves = 1

    def initialize
        @players = []
        @board = []
        @check = false
        @checkmate = false
        @start_position = []
        @place_holder_class = nil
        @place_holder_count = nil
        @remove_check = 0
    end
    
    def save_game
        game_data = {
            players: @players,
            board: @board,
            check: @check,
            checkmate: @checkmate,
            start_position: @start_position,
            place_holder_class: @place_holder_class,
            place_holder_count: @place_holder_count,
            remove_check: @remove_check,
            total_moves: @@total_moves
        }

            Dir.mkdir("saves") unless Dir.exists? "saves"
    
            puts "WARNING! If the filename already exist the data on that file will be overwritten!"
            print "Enter a filename for your save: "
            filename = gets.chomp
    
            File.open("saves/#{filename}.yaml", "w") do |file|
                file.puts game_data.to_yaml
            end
    
            puts "Your progress has been saved!"
        end
    
        def load_game
            filename = nil
            puts Dir.children("saves/")
            loop do
                print "Please enter an existing filename (without the '.yaml'): "
                filename = gets.chomp
                break if File.exists? "saves/#{filename}.yaml"
            end
    
            # Read data from file
            game_data = YAML.load_file("saves/#{filename}.yaml")
    
        # Load data to current game
        @players = game_data[:players]
        @board = game_data[:board]
        @check = game_data[:check]
        @checkmate = game_data[:checkmate]
        @start_position = game_data[:start_position]
        @place_holder_class = game_data[:place_holder_class]
        @place_holder_count = game_data[:place_holder_count]
        @remove_check = game_data[:remove_check]
        @@total_moves = game_data[:total_moves]

        play_game
    end


    def create_players
        game_manager = Player.new("Admin", "Neutral")

        # puts "Hello Friend, let's play a game of Chess"
        puts "Type '1' for a new game or '2' to load a saved game"
        if gets.chomp == '2'
            load_game
        end
        puts ""
        puts "What is your name?"
        name = gets.chomp
        player_1 = Player.new(name, "Black")
        puts "Great! #{player_1.name} will be #{player_1.team}"
        puts ""

        puts "Now we need an opponent"
        puts ""
        puts "Who are you playing?"
        second_name = gets.chomp
        player_2 = Player.new(second_name, "White" )
        puts "#{player_2.name} will be #{player_2.team}."
        puts ""
        puts "Now lets play!"
        puts ""

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
        puts "Save and quit at any time by typing 'save'."
        piece = gets.chomp
        if piece == 'save'
            save_game
            return
        end
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
        @place_holder_class = @board[array[0]][array[1]].class
        @place_holder_count = @board[array[0]][array[1]].move_count
        @start_position = piece.position.clone
            @board[piece.position[0]][piece.position[1]] = Empty_Piece.new(@players[2])
            piece.position = array
            piece.move_count += 1
            @board[array[0]][array[1]] = piece
    end

    def undo_move(piece)
        #move the piece back to its original starting point
        @board[@start_position[0]][@start_position[1]] = piece
        #replace the spot on the board with the original piece there
        if @place_holder_class == Empty_Piece
            x = Empty_Piece.new(@players[2])
        elsif @place_holder_class != Empty_Piece && piece.team == "Black"
            x = @place_holder_class.new(@players[1])
        else
            x = @place_holder_class.new(@players[0])
        end

        @board[piece.position[0]][piece.position[1]] = x
        x.position = piece.position
        x.move_count = @place_holder_count

        #update piece position
        piece.position = @start_position
        piece.move_count -= 1
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
        player_pieces = []
        @board.each do |row|
            row.each do |square|
                    next if square.class == String
                    next if square.team == "Neutral"
                    next if square.team == player.team
                    player_pieces << square 
                end
            end
        player_pieces.each do |square|
            moves = square.possible_moves(player, game)
                if moves.include?(king.position)
                    puts "*****CHECK!*****"
                    puts ""
                    puts "#{player.name}, your #{king.display} is in check from #{convert_array_to_input(square.position)}"
                    @check = true
                    break
                else 
                    @check = false
                end
            end
    end

    def king_still_in_check(player, game)
        king = find_king(player, game)
        player_pieces = []
        @board.each do |row|
            row.each do |square|
                next if square.class == String
                next if square.team == "Neutral"
                next if square.team == player.team
                player_pieces << square 
                end
            end
                player_pieces.each do |square|
                moves = square.possible_moves(player, game)
                    if moves.include?(king.position)
                        @check = true
                        break
                    else 
                        @check = false
                    end
            end
    end

    def check_mate(player, game)
        #find all squares on board that are the players pieces
        player_pieces = []
        piece_moves = []
        @board.each do |row|
            row.each do |square|
                next if square.class == String
                next if square.team == "Neutral"
                next if square.team != player.team
                player_pieces << square
            end
        end
        #simulate every possible move one at a time
                player_pieces.each do |piece|
                    possible_moves = []
                    moves = piece.possible_moves(player, game)
                    moves.each do |move|
                            next if @board[move[0]][move[1]].class == String
                            if @board[move[0]][move[1]].team == "Neutral" || @board[move[0]][move[1]].team != player.team
                                possible_moves << move
                            end
                        end

                    next if possible_moves == []
                    possible_moves.each do |move|
                                        move_piece(piece, move)
                                        king_still_in_check(player, game)
                                            if @check == false
                                            @remove_check += 1
                                            end
                                        undo_move(piece)
                                        @check = true
                    
            end
        end
        #puts "There are #{@remove_check} possible moves"
        game_over(player)
        @remove_check = 0
    end

    def game_over(player)
        if @remove_check == 0
            puts "***** CHECK MATE! *****"
            puts ""
            puts "Sorry, #{player.name} you are in Check Mate"
            puts ""
            puts "Thanks for playing!"
            @check_mate = true
        end
    end


    def take_turn(player, game)
        puts @@total_moves
        self.print_board
        self.king_in_check(player, game)
        if @check == true
            self.check_mate(player, game)
        end
        piece = self.get_input(player)
        moves = piece.possible_moves(player, game)
        self.give_movement_options(piece, player, moves)
            if @check == true
                self.king_still_in_check(player, game)
                    if @check == true
                        puts "Sorry, you need to make a move to take your King out of Check"
                        puts ""
                        undo_move(piece)
                        take_turn(player, game)
                    end
            end
        @@total_moves += 1
        #self.print_board
    end

    def play_game
        while @checkmate == false do
            if @@total_moves.odd?
                self.take_turn(@players[0], self)
            else
                self.take_turn(@players[1], self)
            end
        end
    end

end