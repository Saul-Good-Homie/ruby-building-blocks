require './lib/connect_four.rb'

describe Connect_Four do

    describe "#print_board" do
            it "prints the board to the terminal" do
            game = Connect_Four.new 
            output = game.print_board
            expect(output).to eql(
                [[1, 2, 3, 4, 5, 6, 7],
                ["▢", "▢", "▢", "▢", "▢", "▢", "▢"],
                ["▢", "▢", "▢", "▢", "▢", "▢", "▢"],
                ["▢", "▢", "▢", "▢", "▢", "▢", "▢"],
                ["▢", "▢", "▢", "▢", "▢", "▢", "▢"],
                ["▢", "▢", "▢", "▢", "▢", "▢", "▢"],
                ["▢", "▢", "▢", "▢", "▢", "▢", "▢"]])
            end
        end

    describe "#set_up" do
        it "puts both players in a array" do
            game = Connect_Four.new
            player_1 = Player.new("Jack", "Black")
            player_2 = Player.new("Jill", "white")
            expect(game.set_up(player_1, player_2)).to eql([player_1, player_2])
        end
    end

    # describe "#get_input" do
    #     it "returns a column from the user" do
    #         game = Connect_Four.new
    #         player_1 = Player.new("Jack", "Black")
    #         player_2 = Player.new("Jill", "white")
    #         expect(game.get_input(player_1)).to eql(true)
    #     end
    # end

    describe "#take_turn" do
        it "adds a circle to the correct column chosen" do
            game = Connect_Four.new
            player_1 = Player.new("Jack", "Black")
            player_2 = Player.new("Jill", "white")
            expect(take_turn(player_1)).to eql(
            [[1, 2, 3, 4, 5, 6, 7],
            ["▢", "▢", "▢", "▢", "▢", "▢", "▢"],
            ["▢", "▢", "▢", "▢", "▢", "▢", "▢"],
            ["▢", "▢", "▢", "▢", "▢", "▢", "▢"],
            ["▢", "▢", "▢", "▢", "▢", "▢", "▢"],
            ["▢", "▢", "▢", "▢", "▢", "▢", "▢"],
            ["▢", "Black", "▢", "▢", "▢", "▢", "▢"]]
            )
        end
    end

    describe "#check_column" do
    it "verifies there is an open space in the column" do
        game = Connect_Four.new
        player_1 = Player.new("Jack", "Black")
        player_2 = Player.new("Jill", "white")
        board =  [[1, 2, 3, 4, 5, 6, 7],
        ["▢", "▢", "▢", "▢", "▢", "▢", "▢"],
        ["▢", "▢", "▢", "▢", "▢", "▢", "▢"],
        ["▢", "▢", "▢", "▢", "▢", "▢", "▢"],
        ["▢", "▢", "▢", "▢", "▢", "▢", "▢"],
        ["▢", "▢", "▢", "▢", "▢", "▢", "▢"],
        ["▢", "Black", "▢", "▢", "▢", "▢", "▢"]]
        expect(game.check_column(2)).to eql(2)
    end
end


end