# let's put all students into an array
students = [
  {name: "Dr. Hannibal Lecter", cohort: :november},
  {name: "Darth Vader", cohort: :november},
  {name: "Nurse Ratched", cohort: :november},
  {name: "Michael Corleone", cohort: :november},
  {name: "Alex DeLarge", cohort: :november},
  {name: "The Wicked Witch of the West", cohort: :november},
  {name: "Terminator", cohort: :november},
  {name: "Freddy Krueger", cohort: :november},
  {name: "The Joker", cohort: :november},
  {name: "Joffrey Baratheon", cohort: :november},
  {name: "Norman Bates", cohort: :november}
]

def print_header
    puts "The students of Villains Academy"
    puts "---------------"
end
def print(names)
    names.each_with_index { |student, i| puts "#{i+1}: #{student[:name]} (#{student[:cohort]} cohort)".center(50) }
end

def print_footer(names)
    puts "Overall, we have #{names.count} great students"
end

def input_students
    puts "Please enter the names of students"
    puts "When you've finished just hit enter twice"
    students = []
    name = gets.chomp
    while !name.empty? 
        students << {name: name, cohort: :november}
        puts "Now we have #{students.count} students"
        name = gets.chomp
    end
    #return the array of students
    students
end

def print_names_starting_with(names, letter)
    names.each do |student|
        if student[:name][0] == letter
            puts "#{student[:name]} (#{student[:cohort]} cohort)"
        end
    end
end

def print_names_shorter_than(names,characters)
    puts "Printing students whose names have less that #{characters} characters"
    new_students = names.select{ |student| student[:name].size < characters}
    new_students.each { |s| puts "#{s[:name]} (#{s[:cohort]} cohort)" }
end
    

students = input_students

print_header

print(students)

print_footer(students)

#commenting out unused print methods
#print_names_shorter_than(students,5)
#print_names_starting_with(students,"a")

#def print(names)
#    names.each_with_index do |student, i| 
#        print i+1 
#        print ":"
#        puts "#{student[:name]} (#{student[:cohort]} cohort)".center(50) 
#    end
#end

