puts 'Event Manager Initialized!'

# Checks if event_attendees.csv exists in cwd
puts File.exist? "event_attendees.csv"

# Reads the contents of the event_attendees csv
contents = File.read('event_attendees.csv')

# Reads the file line by line
lines = File.readlines('event_attendees.csv')

lines.each_with_index do |line, index|
  next if index == 0
  columns = line.split(",")
  name = columns[2]
  p columns
end

