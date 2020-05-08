class LinkedList
    attr_accessor :head, :tail, :counter
    
        def initialize
            @head = nil
            @tail = nil
            @counter = 0
        end

        def append(node)
            if @head == nil
                @head = Node.new(node)
            else
                current_node = @head
                while current_node.next_node != nil
                    current_node = current_node.next_node
                end
                current_node.next_node = Node.new(node)
            end
            @counter += 1
        end

        def prepend(node)
            if @head != nil
                node = Node.new(node)
                node.next_node = @head
                @head = node
            else
                @head = Node.new(node)
            end
            @counter += 1
        end

        def size
            puts "The list has #{@counter} elements"
        end

        def head
            puts "The head is #{@head.value}"
        end

        def tail
            current_node = @head
            while current_node.next_node != nil
                current_node = current_node.next_node
            end
            @tail = current_node
            puts "The tail is #{@tail.value}"
        end

        def at(index)
            current_node = @head
            x = index - 1
            x.times do
                current_node = current_node.next_node  
            end
                return current_node
        end

        def pop
            index = 1
            current_node = @head
            while current_node.next_node != nil
                current_node = current_node.next_node
                index += 1
            end
            y = self.at(index - 1)
            y.next_node = nil
            @counter -= 1
            puts "The tail has been removed"
        end

        def contains(node)
            current_node = @head
            while current_node.next_node != nil
                current_node = current_node.next_node
                if current_node.value == node
                    return true
                end
            end
            return false
        end

        def find(node)
            index = 1
            current_node = @head
            while current_node.next_node != nil
                current_node = current_node.next_node
                index += 1
                if current_node.value == node
                    return "#{node} is found at index #{index}"
                end
            end
            return nil
        end

        def insert_at(value, index)
            node = Node.new(value)
            x = self.at(index)
            y = self.at(index - 1)
            node.next_node = x
            y.next_node = node
            @counter += 1
            puts "#{node.value} has been inserted at index #{index}"
        end

        def remove_at(index)
            x = self.at(index)
            y = self.at(index - 1)
            y.next_node = x.next_node
            @counter -= 1
            puts "#{x.value} has been removed from the list"
        end

        def to_s
            current_node = @head
            str = ''
            while current_node != nil
                str += "( #{current_node.value} ) -> "
                current_node = current_node.next_node
            end
            str + 'nil'
        end
end

class Node < LinkedList
    attr_accessor :value, :next_node
    
        def initialize(value = nil, next_node = nil)
            @value = value
            @next_node = next_node
        end
    
end

list = LinkedList.new
list.append("Banana")
list.prepend("Grapes")
list.append("Apple")
puts    list
list.head
list.tail
list.size
list.at(2)
list.find("Apple")
list.insert_at("Carrot", 2)
list.remove_at(3)
list.pop
puts list




