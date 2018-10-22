def print_with_index(names)
    names.each_with_index do |student, i| 
        puts "#{i+1}: #{student[:name]} (#{student[:cohort]} cohort)".center(50) 
    end
end


def edit_students(names)
    puts "Please enter the id of the student you want to edit"
    id = gets.chomp.to_i
    #edit the selected student
    puts "enter the new name"
    names[id - 1][:name] = gets.chomp
    puts "enter the new cohort (leave blank if you wish to leave unchanged)"
    new_cohort = gets.chomp.downcase
    names[id - 1][:cohort] = new_cohort.to_sym if new_cohort != ""
    puts "done"
end

def print_names_shorter_than(names,characters)
    puts "Printing students whose names have less than #{characters} characters"
    new_students = names.select{ |student| student[:name].size < characters}
    new_students.each { |s| puts "#{s[:name]} (#{s[:cohort]} cohort)" }
end


def print_names_by_cohort(names)
    cohorts = []
    names.each do |name| 
        cohorts.push(name[:cohort]) 
    end
    #puts cohorts
    cohorts.uniq!
    cohorts.each do |c|
        puts "------------------------------------------------"
        puts c
        puts "------------------------------------------------"
        names.each do |n|
            puts "  " + n[:name] if n[:cohort] == c
        end
    end
end


def print_names_starting_with(names, letter)
    names.each do |student|
        if student[:name][0] == letter
            puts "#{student[:name]} (#{student[:cohort]} cohort)"
        end
    end
end


