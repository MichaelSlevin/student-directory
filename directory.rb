@default_cohort = "november"

# let's put all students into an array
@students = [
  {name: "Dr. Hannibal Lecter", cohort: :november},
  {name: "Darth Vader", cohort: :november},
  {name: "Nurse Ratched", cohort: :january},
  {name: "Michael Corleone", cohort: :november},
  {name: "Alex DeLarge", cohort: :january},
  {name: "The Wicked Witch of the West", cohort: :november},
  {name: "Terminator", cohort: :february},
  {name: "Freddy Krueger", cohort: :november},
  {name: "The Joker", cohort: :november},
  {name: "Joffrey Baratheon", cohort: :november},
  {name: "Norman Bates", cohort: :december}
]

def print_header
    puts "The students of Villains Academy"
    puts "---------------"
end
def print_student_list
    if @students.count == 0
        puts "no students"
        return
    end
    @students.each_with_index { |student, i| puts "#{i+1}: #{student[:name]} (#{student[:cohort]} cohort)".center(50) }
end


def print_footer
    output = "Overall, we have #{@students.count} great student"
    output += "s" if @students.count > 1
    puts output
end

def input_students
    puts "Please enter the names of students"
    puts "When you've finished just hit enter twice"
    @students = []
    name = gets[0..-2]
    while !name.empty? 
        puts "Enter their cohort:"
        cohort = gets.chomp
        cohort = @default_cohort if cohort == ""
        @students << {name: name, cohort: cohort.downcase.to_sym}
        output_1 = "Now we have #{@students.count} student"
        output_1 += "s" if @students.count > 1
        puts output_1
        name = gets.chomp
    end
    #return the array of students
    @students
end

def save_students
    #open the file for writing
    file = File.open("students.csv", "w")
    #iterate over the array of students
    @students.each do |student|
        student_data = [student[:name],student[:cohort]]
        csv_line = student_data.join(",")
        file.puts csv_line
    end
    file.close
    puts "Saved #{@students.count} students"
end

def show_students
    print_header
    print_student_list
    print_footer
end


loop do
    #list the commands
    puts "1. Input the students"
    puts "2. Show the students"
    puts "3. Save the list to students.csv"
    puts "9. Exit" # 9 because we'll be adding more items
    
    command = gets.chomp.to_i
    case command
        when 1
            input_students
        when 2
            show_students
        when 3
            save_students
        when 9
            puts "Closing the directory"
            exit
        else
            puts "Command not recognised. Try again."
    end
end