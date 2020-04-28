class TicTacToe
@@board = " 1  2  3 \n 4  5  6 \n 7  8  9"
@@game_status = 0
@@players ||= []

    def initialize(name, team)
        @name = name
        @team = team
        @@players << self
    end

    def display_board
        puts @@board
    end

    def update_board(spot)
        @@board.gsub!(/#{spot}/, @team)
    end

    def check_winner(a)
        #checks horizontal
        @new_board = @@board.delete(" ")
        if @new_board.include?("#{a}#{a}#{a}")
            puts "Looks like we hava winner! #{a}'s win with 3 across"
            @@game_status = 1
        #checks vertical 
        elsif (@new_board[0] == a && @new_board[4] == a && @new_board[8] == a) ||
            (@new_board[1] == a && @new_board[5] == a && @new_board[9] == a) ||
            (@new_board[2] == a && @new_board[6] == a && @new_board[10] == a)
            puts "Looks like we hava winner! #{a}'s win with 3 down"
            @@game_status = 1
        #check slash?
        elsif (@new_board[0] == a && @new_board[5] == a && @new_board[10] == a) ||
            (@new_board[2] == a && @new_board[5] == a && @new_board[8] == a)
            puts "Looks like we hava winner! #{a}'s win with 3 diagonal"
            @@game_status = 1
        else
            return false
        end
    end

    def take_turn
        puts "Choose a square to place an #{@team}"
        spot = gets.chomp.to_i
        update_board(spot)
        puts display_board
        check_winner(@team)
    end

    def self.play_game
        while @@game_status == 0 do
        @@players.each {|player| 
        player.take_turn}
        end
    end

end


x_turn = TicTacToe.new("x_turn", "X")
o_turn = TicTacToe.new("o_turn", "O")

puts "Let's play a game of Tic-Tac-Toe"
x_turn.display_board

TicTacToe.play_game








