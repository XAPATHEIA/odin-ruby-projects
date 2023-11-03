def stock_picker(stock)
    profit = 0
    profit_days_array = []
    stock.each_with_index do |day_price, day|
        stock.each_with_index do |second_day_price, second_day|
            if second_day - day > 0 && second_day != day
                profit = second_day_price - day_price
                profit_days_array.push([profit, day_price, second_day_price])
            end
        end
    end
    #profit_days_array.each do |day_details|
    #    puts "Buying price is #{day_details[1]}, selling price is #{day_details[2]}, total profit is #{day_details[0]}" 
    #end
    all_profits = profit_days_array.map {|day_details| day_details[0]}
    #p all_profits
    best_days = profit_days_array.find { |day_details| day_details[0] == all_profits.max() }
    #p best_days
    return [stock.find_index(best_days[1]), stock.find_index(best_days[2])]
end



p stock_picker([17,3,6,9,15,8,6,1,10])