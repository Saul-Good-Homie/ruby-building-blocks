def fibs(n)
arr = [0,1]
    if n == 0
        print arr[0]
    elsif n == 1
        print arr[0..1]
    else
        i = 0
        while i < (n - 1)
            arr.push(arr[-1] + arr[-2])
            i += 1
        end
        print arr
    end
end

fibs(0)
fibs(5)
fibs(8)

def fibs_rec(n)
    return 0 if n == 0 
    return 1 if n == 1
    return fibs_rec(n-1) + fibs_rec(n-2)
end


puts fibs_rec(0)
puts fibs_rec(5)
puts fibs_rec(8)