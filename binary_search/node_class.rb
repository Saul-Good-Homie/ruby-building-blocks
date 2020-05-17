class Node
    include Comparable
    include Enumerable

    attr_accessor :data, :left, :right

    def initialize(data = nil)
        @data = data
        @left = nil
        @right = nil
    end

    def <=>(value)
        if value.is_a? Node
            @val <=> value.data
        else
            @val <=> value
        end
    end

    def to_s
        "#{@data.to_s} {{#{left.to_s}} | {#{right.to_s}}}"
    end

    def inspect
        "{#{@data.to_s} #{left.inspect} | #{right.inspect}}"
    end

end
