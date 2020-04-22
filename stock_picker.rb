#  create an array of 10 random digits between 1-20
$stock_prices = Array.new(10){rand (1..20)}
# $stock_prices = [5, 4, 1, 6, 7, 10]


def stock_loop

print $stock_prices

j = 0
i = j + 1
x = 0

while i < $stock_prices.length do 
    y = $stock_prices[i] - $stock_prices[j]

    if y > x
        x = y
        solution = "The best time to buy is on day #{$stock_prices.index($stock_prices[j])} and sell on day #{$stock_prices.index($stock_prices[i])} for a profit of $#{x}"
    end

    i += 1

    if i == $stock_prices.length && j != $stock_prices.length
        j += 1
        i = j + 1
    end

    end
    puts
    puts solution
end

stock_loop
