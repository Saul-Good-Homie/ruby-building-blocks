class GamePlay
    @@round = 0
    @@game_rounds = 12
    @@game_over = false
    

    #attributes
    @@board = Array.new(12){Array.new(2){Array.new(4, 0)}}
    @@key_array = []

    #behaviors
    
    #update game board [4X4]

    def self.display_board
        @@board.each {|subArray|
        print "#{subArray} \n"}
    end

    #update key pegs [4x4]
    def self.check_code
        puts @guess_array
    end

end

class Player < GamePlay

    #attributes
    attr_accessor :name, :choice
    @@code = []
    @@code_options = ["R", "O", "Y", "G", "B", "I","V"]
    @@key_array = []
    @@key_array_shuffled = []

    #name
    #introduction
    def initialize(name, choice)
        @name = name
        @choice = choice
    end

    def game_instructions
        if @choice == "SET"
puts "Hi #{@name}!\n
Please Select any 4 letters from 'ROYGBIV' in this format 'ABCD' and press enter" 
@code = gets.chomp

        elsif @choice == "BREAK"
puts "Hi #{@name}!\n
The game is Mastermind \n
The computer will choose a random 4 color code \n
the colors are 'R', 'O', 'Y', 'G', 'B', 'I', and 'V' \n
Each turn you will submit a guess in this format 'RYBV'\n
If the color is correct but the position is not you will see a '-'\n
if both the color and position are correct you will see a '+'\n
you have 12 chances to crack the code, good luck!"
        end
    end

    def set_code
        if @choice == "SET"
            @@code = @code.upcase!
            @@code = @code.split('')
        elsif @choice == "BREAK"
            @@code = @@code_options.sample(4)
        end
    end

    def display_code
        @@code
    end

    #make guesses
    def make_guess
puts "Make a guess in this format 'ABCD'\n
Remember the possible colors are: 'R', 'O', 'Y', 'G', 'B', 'I', and 'V'"
        @guess = gets.chomp[0..3]
        @guess_array = @guess.upcase!
        @guess_array = @guess_array.split('')
    end

    def computer_make_guess
        if @@key_array == []
        @guess_array = @@code_options.sample(4)
        elsif @@key_array != []
            n = @@key_array.length
            @guess_array = @guess_array.sample(n).shuffle + (@@code_options - @guess_array).sample(4-n)
        end
    end

    def check_guess
        @@key_array = []
        @guess_array.each_with_index {|value,index|
        if @@code[index] == value
            @@key_array.push("+")
        elsif
            @@code.include? value
            @@key_array.push("-")
        end}
        @@key_array_shuffled = @@key_array.shuffle
    end

    def check_for_winner
        if @@key_array_shuffled == ["+", "+", "+","+"] && @choice == "BREAK"
            puts "Congrats #{@name}! You cracked the code!"
            @@game_over = true

        elsif @@key_array_shuffled == ["+", "+", "+","+"] && @choice == "SET"
            puts "Sorry #{@name}, the computer cracked your code!"
            @@game_over = true 
        end
    end

    def no_winner
        if @@game_over == false && @choice == "BREAK"
            puts "Sorry #{@name}, you didnt crack the code! Better luck next time"
        elsif @@game_over == false && @choice == "SET"
            puts "Good Jobe #{@name}! The Computer could'nt crack your code!"
        end
    end

    def computer_update_board
        computer_make_guess
        check_guess
        @@board[@@round] = [@guess_array,@@key_array_shuffled]
        @@round += 1
        GamePlay.display_board
        check_for_winner
    end

    def update_board
        make_guess
        check_guess
        @@board[@@round] = [@guess_array,@@key_array_shuffled]
        @@round += 1
        GamePlay.display_board
        check_for_winner
    end

    def play_whole_game
        if @choice == "BREAK"
            @@game_rounds.times do
            break if @@game_over == true
            update_board
        end
        elsif @choice == "SET"
            @@game_rounds.times do
            break if @@game_over == true
            computer_update_board
        end
    end
    no_winner
    end

end

newGame = GamePlay.new

puts "Hello, what is your name?"
name = gets.chomp

puts "Do you want to set the code or break the code?\n type 'set' or 'break'"
choice = gets.chomp.upcase!
player1 = Player.new(name, choice)
player1.game_instructions
player1.set_code

GamePlay.display_board

#uncomment this if you want to show the winning code before the game starts
    # print player1.display_code
    # puts

player1.play_whole_game


