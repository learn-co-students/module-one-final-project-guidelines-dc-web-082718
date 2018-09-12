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
    valid_entry = false
    while !valid_entry do

      puts "********* You have chosen to manage #{@bar_choice.name}."
      puts "Please make a selection from the menu options below.\n\n"
      puts "    1. Print Current Drink menu"
      puts "    2. List Current Employees"
      puts "    3. Hire New Employee"
      puts "    4. Fire Employee"
      puts "    5. Return to Bar Owner Portal"
      gets_user_input
      valid_entry = true
      case @input
      when '1'
        puts "You have chosen to Print Current Drink menu."
        @bar_choice.print_drink_menu
      when '2'
        puts "You have chosen to List Current Employees."
        @bar_choice.list_current_employees
      when '3'
        puts "You have chosen to Hire New Employee."
          hire_menu
      when '4'
        puts "You have chosen to Fire an employee."
      when '5'
        puts "You have chosen to return to Bar Owner Portal"
      else
        puts "Please select a valid menu option."
        valid_entry = false
      end
    end
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

  def hire_menu
    puts "*** Hiring Menu for #{@bar_choice.name} ***"
    puts "\n\n *** #{@bar_choice.name} currently has #{@bar_choice.bartenders.size} employee(s)."
    # binding.pry
    if @bar_choice.bartenders.size > 2
      puts "#{@bar_choice.name} is fully staffed and has no room to hire more bartenders."
      puts "I am now returning to bar management menu"
      # return #return to menu
    else
      room_for_hire = (3 - @bar_choice.bartenders.size)
      # binding.pry
      puts "#{@bar_choice.name} has room to hire #{3 - @bar_choice.bartenders.size} bartender(s)."
      puts "I am now calling sub-menu"
      #call sub-menu
      # 1. List unemployed
      # 2. Create new bartender?1
    end
  end
end




end
