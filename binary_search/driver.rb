require_relative 'tree_class'
# 1. Create a binary search tree from an array of random numbers (`Array.new(15) { rand(1..100) }`)
    array = Array.new(15) { rand(1..100)}
    tree = Binary_Search_Tree.new(array)
    tree.pretty_print
# 2. Confirm that the tree is balanced by calling `#balanced?`
    puts tree.balanced?
# 3. Print out all elements in level, pre, post, and in order
    tree.level_order
    puts ""
    puts "The preorder traversal is:"
    p tree.preorder
    puts ""
    puts "The inorder traversal is:"
    p tree.inorder
    puts ""
    puts "The postorder traversal is:"
    p tree.postorder
# 4. try to unbalance the tree by adding several numbers > 100
    puts "Let's add some numbers to imbalance the tree"
    tree.insert(rand(50..100))
    tree.insert(rand(50..100))
    tree.insert(rand(50..100))
    tree.insert(rand(50..100))
    tree.insert(rand(50..100))
    tree.insert(rand(50..100))
    tree.insert(rand(50..100))
    tree.insert(rand(50..100))
    tree.pretty_print
# 5. Confirm that the tree is unbalanced by calling `#balanced?`
    puts tree.balanced?
# 6. Balance the tree by calling `#rebalance!`
    puts "Let's get that tree balanced again"
    tree.rebalance
    tree.pretty_print
# 7. Confirm that the tree is balanced by calling `#balanced?`
    tree.balanced?
# 8. Print out all elements in level, pre, post, and in order
    tree.level_order
    puts ""
    puts "The preorder traversal is:"
    p tree.preorder
    puts ""
    puts "The inorder traversal is:"
    p tree.inorder
    puts ""
    puts "The postorder traversal is:"
    p tree.postorder