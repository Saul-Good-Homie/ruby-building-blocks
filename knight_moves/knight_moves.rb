require_relative 'node.rb'
class Knight_Moves
@@moves = [[1,2],[1,-2],[2,1],[2,-1],[-1,2],[-1,-2],[-2,1],[-2,-1]]
    attr_accessor :board

    def initialize
        @board = Array.new(8) {Array.new(8,"[      ]")}
    end

    def set_node(array)
        node = Node.new
        node.position = array
        @board[array[0]][array[1]] = node
    end

    def valid_move?(pos)
        return false unless @board[pos[0]][pos[1]] == "[      ]"
        true
    end

    def find_possible_moves(pos)
        moves = @@moves.collect {|item| [pos[0] + item[0], pos[1] + item[1]]}
        moves.filter! do |pos|
            pos[0] >= 0 && pos[0] <= 7 && pos[1] >= 0 && pos[1] <= 7
        end
        moves
    end

    def knight_moves(start, finish)
        knight = set_node(start)
        finish = set_node(finish)
        puts "knight: #{knight.position}"
        puts "finish: #{finish.position}"
        queue = []
        path = []
        
        queue << knight

        while(!queue.empty?) do
            node = queue.shift
            if node.visited == false
                node.visited = true
                path << node
            end
            if node.position == finish.position
                find_moves(node, knight)
                return
            end
            moves = find_possible_moves(node.position)
            moves.each {|array|
            next_node = set_node(array)
            next_node.parent = node
            queue << next_node
            }
        end
    end

=begin
Hey saul, when you come back to this later. The problem with the return
is that all the "children" are stored in a single array. Not as 8 individual children.

either A) break them up into 8 individual childrens
or B) find a way to backwards traverse the array and only show the relevent route. 


=end

    def find_moves(node, start)
        moves = []
        until node.parent == nil
            moves << node.position
            node = node.parent
        end 
        moves << start.position
        n = moves.length
        puts "The knight reached the goal in #{n} steps."
        p moves.reverse!
        puts ""
        finish_move
        print__final_board(moves)
    end

    def print_board
        @board.each do |r|
            puts r.each { |p| p }.join(" ")
        end
    end

    def print__final_board(array)
        final_board = Array.new(8) {Array.new(8,"[      ]")}
        array.each { |pos|
        final_board[pos[0]][pos[1]] = "[ #{pos[0]}, #{pos[1]} ]"
        }
        final_board.each do |r|
            puts r.each { |p| p }.join(" ")
        end
    end

    def finish_move
        chess = Knight_Moves.new
    end

end


