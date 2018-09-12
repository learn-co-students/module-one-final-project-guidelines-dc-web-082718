ActiveRecord::Base.logger = nil

class Interface

  def self.welcome
    Artscii.welcome
    print "Welcome to Mini-Muse! The data analytics app for the 500 greatest albums of all time.\nEnter any key to begin:\n"
    # Loop will break once any input is entered
    user_input = nil
    while user_input == nil
      user_input = gets
    end
  end

  def self.main_menu
    user_input = nil
    # This will loop forever, until the user enters a valid option
    while true
      print <<-TEXT
What would you like to learn about today?
  1. List of all artists, albums, or genres
  2. Info from a specific decade
  3. Info about an artist
  4. Info about a genre
  5. Close program
      TEXT
      print "  Input:"
      user_input = gets.chomp
      # binding.pry
      case user_input
        when "1"
          # Choose from artist, album, or genre
          puts "blerg"
        when "2"
          # Choose decade from pre-determined list 50s to 2000s
        when "3"
          # Choose artist, return top 3 most popular albums
        when "4"
          # Choose genre, return top 3 most popular albums
        when "5"
            puts "Goodbye!"
          return
        end
      end
    end


  def self.all_things
    puts "Would you like to see all artists, albums, or genres in the top 500?\n do

    end"
  end
  # End of class definition
end
