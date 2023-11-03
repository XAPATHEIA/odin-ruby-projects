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
    profit_days_array.each do |day_details|
        puts "Buying price is #{day_details[1]}, selling price is #{day_details[2]}, total profit is #{day_details[0]}" 
    end
    all_profits = profit_days_array.select {day_details | day_details[0]}
    puts all_profits
end



stock_picker([17,3,6,9,15,8,6,1,10])

=begin
best_days = []
if stock.present?
    cheapest_day = stock[0]
    priciest_day = stock[0]
    most_profit = 0
while best_days.empty?
    stock.each_with_index do |day_price, day|
        if day_price < cheapest_day
            cheapest_day = day_price
        end
        if day_price > priciest_day
            priciest_day = day_price
        end
    end
    if 
=end