class Node
    attr_accessor :position, :visited, :parent

    def initialize
        @position = nil
        @visited = false
        @parent = nil
    end

    def to_s
        "[#{position}]"
    end

end