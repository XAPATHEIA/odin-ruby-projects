def bubble_sort(numbers)
  list_of_numbers = numbers
  sorted = false
  while !sorted
    sorted = true
    (1...list_of_numbers.length).each do |i|
      if list_of_numbers[i-1] > list_of_numbers[i]
        list_of_numbers[i], list_of_numbers[i-1] = list_of_numbers[i-1], list_of_numbers[i]
        sorted = false
      end
    end
  end
  list_of_numbers
end




p bubble_sort([4,3,78,2,0,2])