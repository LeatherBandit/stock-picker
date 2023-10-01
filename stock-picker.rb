#Implement a method #stock_picker that takes in an array of stock prices, one for each hypothetical day. It should return a pair of days representing the best day to buy and the best day to sell. Days start at 0.
# EX: stock_picker([17,3,6,9,15,8,6,1,10])
# => [1,4] == $12

def stock_picker(stock_array)

    stock_buy_sell = Hash.new
    stock_array.each_with_index do |stock_price, index|

        i = index
        s_temp_array_index= 0
        stock_temp_array = []

        #calculate the difference between the current stock price and future stock price
        while i < stock_array.length
            stock_temp_array[s_temp_array_index] = stock_array[i] - stock_price 
            s_temp_array_index += 1
            i+= 1
        end

        stock_buy_sell[index] = stock_temp_array
    end

    highest_day = 0
    max_value = 0

    #find the day with the highest yield
    stock_buy_sell.each do |key, value|
        if value.max > max_value
            max_value = value.max
            highest_day = key
        end
    end

    #Calculate the index of the best sell
    final_index = [highest_day]
    stock_buy_sell[highest_day].each_with_index do |value, index|
        if value == max_value
            final_index.push(highest_day + index)
        end
    end

    return final_index
end

input_array = [17,3,6,9,15,8,6,1,10]
print "#{stock_picker(input_array)}"