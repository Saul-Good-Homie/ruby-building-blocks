def merge_sort(arr)
n = arr.length
    if n > 1
        b = merge_sort(arr.slice(0, (n/2)))
        c = merge_sort(arr.slice((n/2), n))
        merge(b, c)
    else
        return arr
    end
end

def merge(b, c)
    final_arr = []
        until b.length == 0 || c.length == 0 
            if b[0] > c[0]
                x = c.shift()  
                final_arr << x
            else
                x = b.shift()
                final_arr << x
            end
        end
            if b.empty?
                final_arr << c
            elsif c.empty?
                final_arr << b
            end
    final_arr.flatten!
end

print merge_sort([0,5,3,2]) # => [0,2,3,5]
puts "____________"
print merge_sort([9,2,7]) # => [2,7,9]
puts "____________"
print merge_sort([2,1]) # => [1,2]


