class CommandLineInterface

attr_accessor :input

  def greet
    puts "

     ______   _______  _______  _______  _______ _________ _______           _
    (  ___ \\ (  ___  )(  ___  )/ ___   )(  ____ \\\\__   __/(  ___  )|\\     /|( (    /|
    | (   ) )| (   ) || (   ) |\\/   )  || (    \\/   ) (   | (   ) || )   ( ||  \\  ( |
    | (__/ / | |   | || |   | |    /   )| (__       | |   | |   | || | _ | ||   \\ | |
    |  __ (  | |   | || |   | |   /   / |  __)      | |   | |   | || |( )| || (\\ \\) |
    | (  \\ \\ | |   | || |   | |  /   /  | (         | |   | |   | || || || || | \\   |
    | )___) )| (___) || (___) | /   (_/\\| (____/\\   | |   | (___) || () () || )  \\  |
    |/ \\___/ (_______)(_______)(_______/(_______/   )_(   (_______)(_______)|/    )_)


"
  end

  def gets_user_input
    @input = gets.chomp
  end

  def main_menu
  valid_entry = false
  while !valid_entry do
    puts "*************MAIN MENU***************\n\n\n"
    puts "********* 1. Bar Owner Portal"
    puts "********* 2. Bartender Portal"
    puts "********* 3. Exit this program."
    puts "\n\n\n"
    puts "Please enter a number from the options above:"
    gets_user_input
    if @input == "1"
      puts "Opening Bar Portal"
      bar_portal
    elsif @input == "2"
      puts "Opening Bartender Portal"
      bartender_portal
    elsif @input == "3"
      valid_entry = true
    else
      puts "********* Please enter a valid command. *********\n\n\n"
    end
  end
end

  def bar_portal
  valid_entry = false
  while !valid_entry do
    puts "*************BAR OWNER PORTAL***************\n\n\n"
    puts "********* 1. Manage existing bar."
    puts "********* 2. Open new bar."
    puts "********* 3. Exit this menu."
    puts "\n\n\nPlease enter a number from the options above:"
    gets_user_input
    if @input == "1"
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
    valid_entry = false
    while !valid_entry do
      puts "*************BARTENDER PORTAL***************\n\n\n"
      puts "********* 1. I am a New Bartender."
      puts "********* 2. I am an Existing Bartender."
      puts "********* 3. Exit this menu."
      puts "\n\n\nPlease enter a number from the options above:"
      gets_user_input
      if @input == "1"
        create_bartender
      elsif @input == "2"
        update_bartender
      elsif @input == "3"
        valid_entry = true
      else
        puts "********* Please enter a valid command. *********\n\n\n"
      end
    end
  end

  def open_bar
  #user inputs new bar name
  puts "******** Enter the name of your new bar. *********\n\n"
  puts "******** (Or type 'exit' to leave this menu.) ********"
  gets_user_input
    if @input == 'exit'
      return
    end
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

  def manage_bar
    puts "*************Bar Management Menu***************\n\n\n"
    puts "\n\n\n"
    puts 'Please Select a Bar to Manage: '
    bar_chooser
    #if bar_chooser chooses "exit" @bar_choice is nil. Return to leave this menu
    if @bar_choice == nil
      return
    end

    valid_entry = false
    while !valid_entry do

      puts "********* You are currently managing #{@bar_choice.name}. *********"
      puts "Please make a selection from the menu options below.\n\n"
      puts "    1. Print Current Drink menu"
      puts "    2. List Current Employees"
      puts "    3. Hire New Employee"
      puts "    4. Fire Employee"
      puts "    5. Return to Bar Owner Portal"
      gets_user_input
      case @input
      when '1'
        @bar_choice.print_drink_menu
      when '2'
        @bar_choice.list_current_employees
      when '3'
        hire_menu
      when '4'
        fire_menu
      when '5'
        valid_entry = true
      else
        puts "Please select a valid menu option."
      end
    end
  end

  def bar_chooser
    puts "*** List of Existing Bars in Boozetown ***"
    valid_entry = false

    while !valid_entry do
      # Prints list until valid entry is made
      Bar.all.each {|bar| puts "#{bar.id}. #{bar.name}"}
        puts "\n\n Please select a bar by number or type 'exit' to exit."
        gets_user_input
      if @input == "exit"
        valid_entry = true
      # Validate choice
      elsif Bar.find_by(id: @input.to_i) != nil
        @bar_choice = Bar.find_by(id: @input.to_i)
        # take this choice back into another function
        @bar_choice.name
        valid_entry = true

      else
        puts "Invalid Entry."
        puts "\n\n Please select an existing bar by number."
      end
    end
  end

  def hire_menu
    puts "*** Hiring Menu for #{@bar_choice.name} ***"
    puts "\n\n *** #{@bar_choice.name} currently has #{@bar_choice.bartenders.size} employee(s)."

    # Check if bar has 3 employees already
    if @bar_choice.bartenders.size > 2
      puts "#{@bar_choice.name} is fully staffed and has no room to hire more bartenders."
      puts "I am now returning to bar management menu"
      #return to menu
    else
      room_for_hire = (3 - @bar_choice.bartenders.size)
      puts "#{@bar_choice.name} has room to hire #{3 - @bar_choice.bartenders.size} bartender(s)."

      if Bartender.unemployed.empty?
        puts "\nThere are currently no unemployed Bartenders!\n"
        return #exit this function
      else
        unemployed_bartender_chooser #hires from unemployed bartenders
      end
    end
  end

  def fire_menu
    puts "*** Firing Menu for #{@bar_choice.name} ***"
    #check if any employees
    if @bar_choice.bartenders.size == 0
      puts "#{@bar_choice.name} has no employees to fire."
      return
    end
    puts "*** Please select the number for the corresponding employee you would like to fire. ***"
    #list of current employees
    @bar_choice.list_current_employees
    puts "*** Or type 'exit' to cancel. ***"

    valid_entry = false
    while !valid_entry do
      gets_user_input
      employees = @bar_choice.bartenders
      #check to see if user input is a valid entry
      if @input == "exit"
      valid_entry = true
      elsif @input.to_i > 0 && @input.to_i <= @bar_choice.bartenders.length
        @bartender_choice = employees[(@input.to_i - 1)]
        puts "#{@bartender_choice.name} no longer works at #{@bar_choice.name}."
        @bar_choice.fire(@bartender_choice)
        valid_entry = true
      else
        puts "Please select a valid number corresponding to your employee."
      end
    end
  end

  def unemployed_bartender_chooser
    unemployed = Bartender.unemployed
    puts "*** Select number of corresponding bartender you want to hire or type 'exit' to cancel. ***"


    # List unemployed bartenders, assign number to each.
    index = 0
    while index < unemployed.length do
      puts "#{index + 1}. #{unemployed[index].name}, specializes in:"
      unemployed[index].drinks.each {|drink| puts "       #{drink.name}\n"}
      index += 1
    end

    # Select unemployed bartender
    valid_entry = false
    while !valid_entry do
      gets_user_input
      # Allow user to leave menu
      if @input == "exit"
      valid_entry = true
      # Check for valid user choice
      elsif @input.to_i > 0 && @input.to_i <= unemployed.length
        @bartender_choice = unemployed[(@input.to_i - 1)]
        puts "Congratulations, you have hired #{@bartender_choice.name}"
        @bar_choice.hire(@bartender_choice)
        valid_entry = true
      else
        puts "Please select a valid entry."
      end
    end
  end

  def create_bartender
  # Prompt user for their name
  puts "Welcome new bartender! Please enter your name:"
  puts "\nor enter 'exit' to go back"
  gets_user_input
  if @input == 'exit'
    return
  end
  #Check if name already exists
  if Bartender.find_by(name: @input)
    puts "Boozetown already has a bartender named #{@input}."
    # puts "Please enter a new name or go back to Bartender Main Menu."
    return
  else
    Bartender.create(name: @input)
  end
end

  def update_bartender
  puts "*************Bartender Update Menu*************\n\n\n"
  puts 'Please Enter a Bartender Name to Update: '
  # Call bartender_chooser function to get @bartender_choice
  bartender_chooser
  if @bartender_choice == nil
    return
  end
  valid_entry = false
  while !valid_entry do
    puts "********** Welcome #{@bartender_choice.name} **********"
    puts "Please make a seleciton from the menu options below. \n\n"
    puts "    1. List my drink specialties"
    puts "    2. Add a new drink specialty"
    puts "    3. Remove a drink specialty"
    puts "    4. Quit Job"
    puts "    5. Return to Bartender Portal."
    # IDEA show list of bars with open slots
    gets_user_input
    case @input
    when '1'
      puts "Listing your drink specialties"
      if @bartender_choice.drinks.size == 0
        puts "You currently have no drink specialties."
        puts "(You may declare up to two cocktail specialties.)"
      else
        @bartender_choice.list_drinks
        puts "\n\n\n"
      end
    when '2'
      puts "Adding a new drink specialty"
      drink_adder
      puts "\n\n\n"
    when '3'
      puts "Removing a drink specialty"
      drink_remover
    when '4'
      puts "Quitting your job"
      @bartender_choice.quits_bar
    when '5'
      puts "Returning to Bartender Portal"
      valid_entry = true
    else
      puts "Please select a valid menu option."
    end
  end
end

  def drink_adder
    if @bartender_choice.drinks.size == 2
      puts "You already have the maximum 2 drink specialties."
      puts "You will have to drop one to add a new drink to your repertoire."
      return
    end
  puts "Enter the name of the new drink."
  gets_user_input
  #See if this drink already exists in the drink table
  drink_choice = Drink.find_by(name: @input)
  if drink_choice == nil
    puts "You are the first bartender to specialize in a(n) #{@input}."
    #Add this drink to the drink table
    drink_choice = Drink.create(name: @input)
  end
  #Add this drink to the bartender
  @bartender_choice.learn_drink(drink_choice.name)
end

  def bartender_chooser
  gets_user_input
  user_choice = Bartender.find_by(name: @input)
  if user_choice != nil
    @bartender_choice = user_choice
    return
  else
    puts "There is no bartender of that name."
  end
end

  def drink_remover
  #List current drinks validate there are drinks to remove
  if @bartender_choice.drinks.size == 0
    puts "You don't currently have any drink specialties to remove."
    return
  end

  puts "#{@bartender_choice.name} currently specializes in:"
  @bartender_choice.list_drinks

  #get input
  puts "\n\nPlease enter the name of the drink you would like to remove: "
  valid_choice = false
  while !valid_choice do
    gets_user_input
    @bartender_choice.drinks.each do |drink|
      if drink.name == @input
        @bartender_choice.drop_specialization(drink.id)
        valid_choice = true
        # puts "#{@bartender_choice.name} "
        return
      end
    end
    puts "Drink choice invalid, please enter a valid drink name."
  end
end
end
