class CommandLineInterface

attr_accessor :input

def greet
  puts "Welcome to BoozeTown"
  puts "How can we help you, are you a bar owner or bartender?"
end

def gets_user_input
  @input = gets.chomp
end

def bar_portal
  puts "*************BAR OWNER PORTAL***************\n\n\n"
  valid_entry = false
  while !valid_entry do
    puts "********* 1. Manage existing bar."
    puts "********* 2. Open new bar."
    puts "********* 3. Exit this menu."
    gets_user_input
    if @input == "1"
      puts "calling manage_bar function"
      manage_bar
    elsif @input == "2"
      open_bar
    elsif @input == "3"
      valid_entry = true
    else
      puts "********* Please enter a valid command. *********\n\n\n"
    end
  end
end

def bartender_portal
#list options for bartenders
end

def open_bar
  #user inputs new bar name
  puts "******** Enter the name of your new bar. *********\n\n"
  gets_user_input

  #check if that bar exists
  if Bar.find_by(name: @input)
    puts "******** #{@input} already exists. *********\n\n"
    puts "Which would you like to do? \n\n"
    bar_portal

  else
    #create a new bar
    puts "Your new bar is #{@input}."
    puts "Please select what you would like to next \n\n"
    Bar.create(name: @input)
  end
end

    #if so go to manage bar portal

  #create new instance of a bar and assign name

  #prompt user if they would hire employeees or manage bar

  def manage_bar
    puts '*********Bar Management Menu*********\n\n\n'
    puts 'Please Select a Bar to Manage: '
    bar_chooser
    # 1. Print Current Drink menu
    # 2. List Current Employees
    # 3. Hire New Employee
    # 4. Fire Employee
  end

  def bar_chooser
    puts "*** List of Existing Bars in Boozetown ***"
    valid_entry = false

    while !valid_entry do # Prints list until valid entry is made
      Bar.all.each {|bar| puts "#{bar.id}. #{bar.name}"}
        puts "\n\n Please select a bar by number"
        gets_user_input
      # Validate choice
        if Bar.find_by(id: @input.to_i) != nil
        puts "Bar exists"
        @bar_choice = Bar.find_by(id: @input.to_i)
        puts @bar_choice.name
        valid_entry = true
        # take this choice back into another function
      else
        puts "Invalid Entry."
        puts "\n\n Please select an existing bar by number."
      end
    end

  end










end
