def stock_picker(stock)
    profit = 0
    profit_days_array = []
    stock_picker.each_with_index do |day_price, day|
        stock_picker.each_with_index do |second_day_price, second_day|
            if second_day - day > 0 && second_day != day
                profit = day_price - second_day_price
                profit_days_array.push([profit, day_price, second_day_price])
            end
        end
    end
    profit_days_array
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