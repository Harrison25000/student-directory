#putting all students into an array
students = [
 "Dr. Hannibal Lecter",
 "Darth Vader",
 "Nurse Ratched",
 "Michael Corleone",
 "Alex DeLarge",
 "The Wicked Witch of the West",
 "Terminator",
 "Freddy Krueger",
 "The Joker",
 "Joffrey Baratheon",
 "Norman Bates",
]
#Then we print them
def print_header
puts "The students of Villains Academy"
puts "------------"
end
def print(names)
names.each do |student|
  puts student
end
end
#We print the total number of students
def print_footer(names)
  puts "Overall, we have #{names.count} great students."
end
#nothing happens until we have called each method
print_header
print(students)
print_footer(students)
