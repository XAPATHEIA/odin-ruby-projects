require 'csv'
puts 'Event Manager Initialized!'

# Checks if event_attendees.csv exists in cwd
puts File.exist? "event_attendees.csv"



contents = CSV.open(
  'event_attendees.csv', 
  headers: true,
  header_converters: :symbol
)

contents.each do |row|
  name = row[:first_name]
  zipcode = row[:zipcode]
  puts "#{name} #{zipcode}"

  # if the zip code is exactly five digits, assume that it is ok
  # if the zip code is more than five digits, truncate it to the first five digits
  # if the zip code is less than five digits, add zeros to the front until it becomes five digits
end
