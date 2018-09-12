require_relative '../config/environment'

cli = CommandLineInterface.new
cli.greet
cli.main_menu
puts "Thank you for using BoozeTown, Goodbye!"
