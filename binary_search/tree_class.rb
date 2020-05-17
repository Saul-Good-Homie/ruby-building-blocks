require_relative 'node_class.rb'

class Binary_Search_Tree
    attr_accessor :array, :root

    def initialize(array)
        @array = array.sort!.uniq!
        @root = build_tree(array)
    end

    def build_tree(array)
        return nil unless array[0]
        return Node.new(array[0]) if array.length < 2
        mid = array.length/2
        root = Node.new(array[mid])
            if mid == 0
                return Node.new(array[mid])
            else
                root.left = build_tree(array[0...mid])
                root.right = build_tree(array[mid + 1..-1])
            end
        return root
    end

    def insert(value, node=@root)
        if node.data.nil?
            node = Node.new(value)
        elsif node.data == value
            return node
        elsif value < node.data
            if (node.left)
                insert(value, node.left)
            else 
                node.left = Node.new(value)
            end
        elsif value > node.data
            if (node.right)
                insert(value, node.right)
            else
                node.right = Node.new(value)
            end
        end
    end

    def find_parent(node=@root, value)
        if(find(value))
        if (node.left.data == value || node.right.data == value)
                return node
            elsif value > node.data
                find_parent(node.right, value)
            else value < node.data
                find_parent(node.left, value) 		
            end
        end
    end

    def find(node=@root, value)
        return nil if node.nil?
            if value == node.data 
                return node
            elsif value > node.data
                find(node.right, value)
            else value < node.data
                find(node.left, value) 		
            end
    end


    def delete(value)
        #find node to delete
        node = find(value)
        parent = find_parent(value)
        #if node has no children, find parent and set correct child node to nil
            if node.left.nil? && node.right.nil?
                if parent.data > node.data
                    parent.left = nil
                else
                    parent.right = nil
                end
        #check if there is a left child but no right child
            elsif !node.left.nil? && node.right.nil?
                    if parent.data > node.data
                        parent.left = node.left
                    end
        #check if there is a right child but no left child
            elsif node.left.nil? && !node.right.nil?
                    if parent.data < node.data
                        parent.right = node.right
                    end
        # If node has 2 children, replace node with node.right
        # and set node.right.left.left = node.left
            else
                parent.right = node.right
                node.right.left.left = node.left
            end
        end

        def level_order(node=@root)
            queue = []
            final_array = []
            #step 1 - queue the node
                queue.push(node)
            #step 2 - move node.data to final array and queue node.children
            while(!queue.empty?) do
                fifo = queue.shift
                block_given? ? yield(fifo) : final_array.push(fifo.data)
                if (fifo.left) then queue.push(fifo.left) end
                if (fifo.right) then queue.push(fifo.right) end
            end
                puts "The level_order (Breadth-first Traversal): #{final_array.join(',')}" unless block_given?
                return final_array
        end

        def preorder(node = @root, result = [])
            return if node.nil?
                block_given? ? yield(node) : result << node.data
                preorder(node.left, result)
                preorder(node.right, result)
            return result
        end

        def inorder(node = @root, result = [])
            return if node.nil?
                inorder(node.left, result)
                block_given? ? yield(node) : result << node.data
                inorder(node.right, result)
            return result
            
        end

        def postorder(node = @root, result = [])
            return if node.nil?
                postorder(node.left, result)
                postorder(node.right, result)
                block_given? ? yield(node) : result << node.data
            return result
        end

        def pretty_print(node = root, prefix="", is_left = true)
            pretty_print(node.right, "#{prefix}#{is_left ? "│   " : "    "}", false) if node.right
            puts "#{prefix}#{is_left ? "└── " : "┌── "}#{node.data.to_s}"
            pretty_print(node.left, "#{prefix}#{is_left ? "    " : "│   "}", true) if node.left
        end

        def balanced?
            left = find_depth(@root.left)
            right = find_depth(@root.right)
            (left - right).abs <= 1 ? "Tree is Balanced." : "Tree is imbalanced."
        end

        def rebalance
            fresh_tree = self.level_order
            fresh_tree.sort!
            @root = build_tree(fresh_tree)
        end

        def depth(value)
            node = find(value)
            find_depth(node)
        end
    
        def find_depth(node = @root)
            return -1 if node.nil?
            left_depth = find_depth(node.left)
            right_depth = find_depth(node.right)
            left_depth > right_depth ? left_depth + 1 : right_depth + 1
        end
end








