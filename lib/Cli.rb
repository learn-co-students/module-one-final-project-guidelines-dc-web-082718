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
      puts "manage_bar"
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
  if Bar.find_by(name: @input) == !nil
    puts "******** #{@input} This bar already exists. *********\n\n"
    puts "Which would you like to do? \n\n"
    bar_portal
    # puts "1. Manage #{@input}"
    # puts "2. Create a new one."
    # gets_user_input
    # if @input == "1"
    #   #manage bar portal
    #   puts "user going to manage bar portal"
    # elsif @input == "2"
    #   #create new bar
    #   puts "user going to create new bar"
    # else
    #   puts "Please enter valid command."
    # end
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

  #













end
