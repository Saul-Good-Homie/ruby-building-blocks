require_relative 'players.rb'

class Connect_Four
    attr_accessor :board_spaces, :header_row, :board, :players, :game_over
    black = "\u25CF"
    white = "\u26AA"

    def initialize
        @board = Array.new(7) {Array.new(7, "\u23FA")}
            @board[0][0] = 1
            @board[0][1] = 2
            @board[0][2] = 3
            @board[0][3] = 4
            @board[0][4] = 5
            @board[0][5] = 6
            @board[0][6] = 7
        @players = []
        @game_over = false
        
    end

    def print_board
        @board.each do |r|
            puts r.each { |p| p }.join(" ")
        end
        puts ""
    end

    def set_up(player_1, player_2)
        players << player_1
        players << player_2
    end

    def get_input(player)
        puts "#{player.name} choose a column number to drop a '#{player.team}''"
        spot = gets.chomp.to_i 
        spot = spot - 1
            if check_column(spot, player) == true
                return spot
            else
                get_input(player)
            end
    end

    def check_column(row=6, col, player)
        return false if row < 1
        if board[row][col] == "\u23FA"
            return true
        elsif board[row][col].nil?
            return false
        else 
            check_column(row -= 1, col, player)
        end 
    end

    def update_board(row = 6, col, player)
        if board[row][col] == "\u23FA"
            board[row][col] = player.team
        else
            update_board(row - 1, col, player)
        end
    end

    def check_winner(player)
            if 
                check_horizontal_winner(player)
            elsif 
                check_vertical_winner(player)
            else 
                check_for_tie
            end
    end

    def check_horizontal_winner(player)
        board.each{|row|
            if row.each_cons(4).any? {|a,b,c,d| a == "#{player.team}" && b == "#{player.team}" && c == "#{player.team}" && d == "#{player.team}" }
            puts "congrats, #{player.name}! You Win!"
            @game_over = true
            return true
            end
        }
        return false
    end

    def check_vertical_winner(player)

        p vertical_array
        # vertical_array.each{|col|
        #     if col.each_cons(4).any? {|a,b,c,d| a == "#{player.team}" && b == "#{player.team}" && c == "#{player.team}" && d == "#{player.team}" }
        #     puts "congrats, #{player.name}! You Win!"
        #     @game_over = true
        #     return true
        #     end
        # }   
        # return false
    end

    def check_for_tie
        new_board = board.flatten
        if !new_board.include?("\u23FA")
            puts "looks like we have a tie game!"
            @game_over = true
        end
    end

    def take_turn(player)
        spot = self.get_input(player)
        self.update_board(spot, player)
        self.print_board
        self.check_winner(player)
    end

    def play_game
        42.times{
            self.take_turn(@players[0])
            break if @game_over == true
            self.take_turn(@players[1])
            break if @game_over == true
        }  
    end

end