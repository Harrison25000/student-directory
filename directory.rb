@students = [] #An empty array accessible to all methods
#putting all students into an array
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  #create an empty array
  students = []
  #get the first name
  name = STDIN.gets.chomp
  #while the name is not empty, repeat this code
  while !name.empty? do
    #add the student hash to the array

    @students << {name: name, cohort: :november}
    puts "Now we have #{@students.count} students"
    #get another name from user
    name = STDIN.gets.chomp
  end
end

#Then we print them
def print_header
puts "The students of Villains Academy"
puts "------------"
end

def print_students_list
  if @students == []
    puts "We have no students"
    return
  end
@students.each do |student|
 puts "#{student[:name]} (#{student[:cohort]} cohort)"
end
end

#We print the total number of students
def print_footer
  if @students.count == 0
    return
  end
  puts "Overall, we have #{@students.count} great students."
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  end
file.close
end

def try_load_students
  filename = ARGV.first #first argument from the command line
  return if filename.nil? #get out of the method if it isnt given
  if File.exists?(filename) #if it exists
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else #if it doesn't exist
    puts "Sorry #{filename} doesn't exist."
    exit #quit the program
  end
end

def process(selection)
  case selection
    when "1"
      students = input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      exit
    else
      puts "I don't know what you meant, try again"
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end


#nothing happens until we have called each method
try_load_students
interactive_menu
