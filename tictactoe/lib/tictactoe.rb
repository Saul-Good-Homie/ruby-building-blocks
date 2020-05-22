require_relative "player.rb"
class TicTacToe
    attr_accessor :board, :game_status, :players, :available_moves

    def initialize
        @board = " 1  2  3 \n 4  5  6 \n 7  8  9"
        @status = 0
        @available_moves = [1,2,3,4,5,6,7,8,9]
        @players = []
    end

    def setup(player_1, player_2)
        players << player_1
        players << player_2
    end

    def display_board
        puts @board
    end

    def update_board(spot, player)
        board.gsub!(/#{spot}/, player.team)
        @available_moves.delete(spot)
    end

    def check_winner(player)
        #checks horizontal
        @new_board = @board.delete(" ")
        if @new_board.include?("#{player.team}#{player.team}#{player.team}")
            puts "Looks like we hava winner! #{player.name}'s win with 3 #{player.team}'s' across!"
            @status = 1
        #checks vertical 
        elsif (@new_board[0] == player.team && @new_board[4] == player.team && @new_board[8] == player.team) ||
            (@new_board[1] == player.team && @new_board[5] == player.team && @new_board[9] == player.team) ||
            (@new_board[2] == player.team && @new_board[6] == player.team && @new_board[10] == player.team)
            puts "Looks like we hava winner! #{player.name} win's with 3 #{player.team}'s' down!"
            @status = 1
        #check diagonal?
        elsif (@new_board[0] == player.team && @new_board[5] == player.team && @new_board[10] == player.team) ||
            (@new_board[2] == player.team && @new_board[5] == player.team && @new_board[8] == player.team)
            puts "Looks like we hava winner! #{player.name} win's with 3 diagonal #{player.team}'s'!"
            @status = 1
        elsif
            @available_moves.empty? 
            puts "Looks like we have a tie, better luck next time!"
            @status = 1
        else
            return false
        end
    end

    def get_input(player)
        puts "#{player.name} choose a square to place an '#{player.team}''"
        spot = gets.chomp.to_i 
            if @available_moves.include?(spot)
                return spot
            else 
                get_input(player)
            end
    end

    def take_turn(player)
        spot = self.get_input(player)
        self.update_board(spot, player)
        self.display_board
        self.check_winner(player)
    end

    def play_game
        9.times{
            self.take_turn(@players[0])
            break if @status != 0
            self.take_turn(@players[1])
            break if @status != 0
        }    
    end

end









