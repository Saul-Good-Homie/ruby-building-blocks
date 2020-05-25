require './lib/connect_four.rb'

describe Connect_Four do

    describe "#print_board" do
        it "prints the board to the terminal" do
            game = Connect_Four.new 
            output = game.print_board
        expect(game.board).to eql(
            [[1, 2, 3, 4, 5, 6, 7],
            ["\u23FA", "\u23FA", "\u23FA", "\u23FA", "\u23FA", "\u23FA", "\u23FA"],
            ["\u23FA", "\u23FA", "\u23FA", "\u23FA", "\u23FA", "\u23FA", "\u23FA"],
            ["\u23FA", "\u23FA", "\u23FA", "\u23FA", "\u23FA", "\u23FA", "\u23FA"],
            ["\u23FA", "\u23FA", "\u23FA", "\u23FA", "\u23FA", "\u23FA", "\u23FA"],
            ["\u23FA", "\u23FA", "\u23FA", "\u23FA", "\u23FA", "\u23FA", "\u23FA"],
            ["\u23FA", "\u23FA", "\u23FA", "\u23FA", "\u23FA", "\u23FA", "\u23FA"]])
        end
    end

    describe "#set_up" do
        it "puts both players in a array" do
            game = Connect_Four.new
            player_1 = Player.new("Jack", "Black")
            player_2 = Player.new("Jill", "white")
            game.set_up(player_1, player_2)
        expect(game.players).to eql([player_1, player_2])
        end
    end

    describe "#get_input" do
    it "accepts a column from the user" do
            game = Connect_Four.new
            player_1 = Player.new("Jack", "Black")
            player_2 = Player.new("Jill", "white")
            game.stub(:gets) {"3\n"}
        expect(game.get_input(player_1)).to eql(2)
        end
    end

    describe "#check_column" do
    it "it verifies a column is not full" do
            game = Connect_Four.new
            player_1 = Player.new("Jack", "Black")
            player_2 = Player.new("Jill", "white")
            game.board[6][4] = "\u23FA"
        expect(game.check_column(4, player_1)).to eql(true)
        end
    end

    describe "#update_board" do
    it "it updates the board with the players team" do
            game = Connect_Four.new
            player_1 = Player.new("Jack", "Black")
            player_2 = Player.new("Jill", "white")
            game.board[6][4] = "\u23FA"
            game.update_board(4, player_1)
        expect(game.board[6][4]).to eql(player_1.team)
        end
    end

    describe "#gets_row" do
    it "it returns the row the piece lands in" do
            game = Connect_Four.new
            player_1 = Player.new("Jack", "Black")
            player_2 = Player.new("Jill", "white")
            game.board[6][4] = player_2.team
        expect(game.gets_row(4, player_1)).to eql(5)
        end
    end

    describe "#check_horizontal_winner" do
        it "it checks for winner horizontally" do
            game = Connect_Four.new
            player_1 = Player.new("Jack", "Black")
            player_2 = Player.new("Jill", "white")
            game.board[6][3] = player_1.team
            game.board[6][4] = player_1.team
            game.board[6][5] = player_1.team
            game.board[6][6] = player_1.team
            game.check_horizontal_winner(player_1)
        expect(game.game_over).to eql(true)
        end
    end

    describe "#check_vertical_winner" do
        it "it checks for winner vertically" do
            game = Connect_Four.new
            player_1 = Player.new("Jack", "Black")
            player_2 = Player.new("Jill", "white")
            game.board[6][4] = player_1.team
            game.board[5][4] = player_1.team
            game.board[4][4] = player_1.team
            game.board[3][4] = player_1.team
            game.check_vertical_winner(player_1)
        expect(game.game_over).to eql(true)
        end
    end

    describe "#check_diagonal_winner" do
        it "it checks for winner diagonally" do
            game = Connect_Four.new
            player_1 = Player.new("Jack", "Black")
            player_2 = Player.new("Jill", "white")
            game.board[6][4] = player_1.team
            game.board[5][3] = player_1.team
            game.board[4][2] = player_1.team
            game.board[3][1] = player_1.team
            game.check_diagonal_winner(player_1, 3, 1)
        expect(game.game_over).to eql(true)
        end
    end

    describe "#check_for_tie" do
        it "it checks for a tie scenario" do
            game = Connect_Four.new
            player_1 = Player.new("Jack", "Black")
            player_2 = Player.new("Jill", "white")
            game.board.map!{|a| a = "test"}
            game.check_for_tie
        expect(game.game_over).to eql(true)
        end
    end


end