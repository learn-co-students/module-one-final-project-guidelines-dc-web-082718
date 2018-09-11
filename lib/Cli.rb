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
  valid_entry = false
  while !valid_entry do
    puts "1. Manage existing bar."
    puts "2. Open new bar."
    gets_user_input
    if @input == "1"
      puts "manage_bar"
      valid_entry = true
    elsif @input == "2"
      puts "open_bar"
      valid_entry = true
    else
      puts "Please enter a valid command."
    end
  end
end

def bartender_portal
#list options for bartenders
end











end
