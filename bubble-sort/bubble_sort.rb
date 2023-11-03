def bubble_sort(numbers)
  sorted = false
  unless sorted
    sorted = true
    numbers.each_with_index do |number, index|
      if number > numbers[index + 1] && index + 1 < numbers.length
        numbers[index], numbers[index + 1] = numbers[index + 1], numbers[index]
        sorted = false
      end
    end
end




p bubble_sort([4,3,78,2,0,2])