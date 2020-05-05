require 'yaml'
class Hangman

@@wrong_guess = []
@@board = []
@@used_letters = []
@@round = 0
@@game_status = 0

    def initialize(name)
        @name = name
    end

    def rules_of_game
    @rules = "Hello, #{@name}\nLet's play a game of hangman\nguess letters to reveal the secret word"
    puts @rules.ljust(5)
    puts "type 1 for a new game or \n2 to load a previous save"
        if gets.chomp == '2'
            load_game
        end
    end

    def choose_rand_word
        @dictionary = File.readlines("5desk.txt").select {|line|
            line if line.length >= 5 && line.length <= 12
            }
            @answer = @dictionary.sample
            @answer.delete!("\n").upcase!
            @answer.strip!
            @@board += ["__"] * @answer.length
            return
            #unhide this line if you want to see the secret word from the start
            #puts @answer      
        end 

    def display_board
        puts " \n"
        puts "Game Board:"
        puts " \n"
        print @@board  
    end

    def display_wrong_guesses
        puts " \n"
        puts "Incorrect guesses:"
        puts " \n"
        print @@wrong_guess
    end

    def display_rounds
        puts "\n"
        puts "You have made #{@@wrong_guess.length} wrong guesses out of 9 allowed"
    end

    def check_winner
        if @@board.join("") == @answer
            puts "congrats #{@name}! you win!"
            display_board
            @@game_status = 1
        elsif @@wrong_guess.length >= 9
            puts "Sorry #{@name}, better luck next time"
            puts "The secret word was #{@answer}"
            @@game_status = 1
        end
    end

    def find_all
        i = -1
        all = []
            while i = @answer.index(@guess,i+1)
            all << i
            end
        all
    end

    def make_guess
        puts "Choose a letter or press 1 to save"
        @guess = gets.chomp.upcase[0] rescue nil
        while @guess.nil?
            puts "Choose a letter or prss 1 to save"
            @guess = gets.chomp.upcase[0] rescue nil
        end
        while @@used_letters.include? @guess
            puts "That letter has already been tried, choose a new letter"
            @guess = gets.chomp.upcase[0] rescue nil
        end
        if @guess == '1'
            save_game
        elsif @answer.include? "#{@guess}"
            find_all.each {|n| 
                @@board[n] = @guess
            }
            puts "Good guess!"
        else
            @@wrong_guess.push(@guess)
            puts "Sorry, guess again!"
        end
        @@used_letters.push(@guess)
    end

    def play_game
        while @@game_status == 0 do 
            display_board
            display_wrong_guesses
            display_rounds
            make_guess
            check_winner
        end
    end

    def save_game
        game_data = {
            answer: @answer,
            wrong_guess: @@wrong_guess,
            board: @@board,
            used_letters: @@used_letters,
            round: @@round,
            game_status: @@game_status
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
        @@wrong_guess = game_data[:wrong_guess]
        @@board = game_data[:board]
        @@used_letters = game_data[:used_letters]
        @@round = game_data[:rounds]
        @@game_status = game_data[:game_status]
        @answer = game_data[:answer]
        play_game
    end

end

puts "Hello, what is your name?"
name = gets.chomp
player = Hangman.new(name)

player.rules_of_game
puts player.choose_rand_word
player.play_game


