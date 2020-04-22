# create an array
$bubbles = Array.new(6){rand (1..10)}
$length = $bubbles.length - 1

def bubbles_sort
    print "The original array is #{$bubbles}"
    puts
# sort entire array n-1 times where n = the number of elements in the array
$length.times do  
    arr= []
    i = 0
$length.times do
# select the first 2 elements of the array
    a = $bubbles[i]
    b = $bubbles[i+1]

    arr.push(a)
    arr.push(b)
        if a > b
            arr.reverse!
            $bubbles[i] = arr[0]
            $bubbles[i+1] = arr[1]
        end

# move to next pair
    i += 1
        end
    end
    print "The sorted array is #{$bubbles}"
end

bubbles_sort