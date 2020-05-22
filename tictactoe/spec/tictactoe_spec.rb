require './lib/tictactoe.rb'

describe TicTacToe do

    describe "#check_winner" do
            it "ends a game if 3 across" do
            game = TicTacToe.new 
        
            player_1 = Player.new("Sally", "X")
            player_2 = Player.new("Jasper", "O")
            game.board = " #{player_1.team}  #{player_1.team}  #{player_1.team} \n 4  5  6 \n 7  8  9"
            expect(game.check_winner(player_1)).to eql(1)
            end


            it "ends a game if 3 vertical" do
                game = TicTacToe.new 
                
                player_1 = Player.new("Sally", "X")
                player_2 = Player.new("Jasper", "O")
                game.board = " #{player_1.team}  2  3 \n #{player_1.team}  5  6 \n #{player_1.team}  8  9"
                expect(game.check_winner(player_1)).to eql(1)
                end

            it "ends a game if 3 diagonal" do
                game = TicTacToe.new 
                
                player_1 = Player.new("Sally", "X")
                player_2 = Player.new("Jasper", "O")
                game.board = " #{player_1.team}  2  3 \n 4  #{player_1.team}  6 \n 7  8  #{player_1.team}"
                expect(game.check_winner(player_1)).to eql(1)
                end

            it "ends a game with a tie" do
                game = TicTacToe.new 
        
                player_1 = Player.new("Sally", "X")
                player_2 = Player.new("Jasper", "O")
                game.available_moves = []
                expect(game.check_winner(player_1)).to eql(1)
                end
    end

end