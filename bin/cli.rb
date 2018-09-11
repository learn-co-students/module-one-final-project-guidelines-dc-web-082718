require_relative '../config/environment'
ActiveRecord::Base.logger = nil

def greeting
  puts File.read('app/ascii/tomatr_ascii')
  puts "Welcome to Tomatr!"
  prompt = TTY::Prompt.new
  prompt.keypress("Press any key to continue.")
end

def menu
  prompt = TTY::Prompt.new
  prompt.select("Choose a menu option?") do |menu|
    menu.choice 'See the top ten movies in theaters', 1
    menu.choice "Find information about a specific movie", 2
    menu.choice "Find movies in a specific genre", 3
    menu.choice 'Find family-friendly movies', 4
    menu.choice 'Find movies starring a specific actor', 5
    menu.choice 'Find movies with a specific director', 6
  end
end

def display_top_ten
  system('clear')
  top_ten = Movie.top_ten
  puts "Today's top ten freshest movies are:"
  puts "1. #{top_ten[0].name}"
  puts "2. #{top_ten[1].name}"
  puts "3. #{top_ten[2].name}"
  puts "4. #{top_ten[3].name}"
  puts "5. #{top_ten[4].name}"
  puts "6. #{top_ten[5].name}"
  puts "7. #{top_ten[6].name}"
  puts "8. #{top_ten[7].name}"
  puts "9. #{top_ten[8].name}"
  puts "10. #{top_ten[9].name}"
end

def see_more_info?
  prompt = TTY::Prompt.new
  prompt.yes?("\nWould you like to see more info about one of these movies?") do |q|
    q.suffix 'YES/NO'
    q.positive 'YES'
    q.negative 'NO'
  end
end

def top_ten_menu

  # Calls on helper method to puts the top ten movies.
  display_top_ten

  # Ask if the user would like to see more info
  yesno = see_more_info?

  case yesno
  when "YES"
    movie = ask_for_movie
    put_movie_info(movie)
  when "NO"
    menu
  end

end

def ask_for_movie
  prompt = TTY::Prompt.new
  prompt.ask("Enter the name of a movie.")
end

def put_movie_info(movie_name)
  # Accepts a movie name as a string and puts info about it
  Movie.find_by(name: movie_name).info
end

def menu_reader(input)
  # Chooses a next step based on the menu input
  case input
  when 1
    # top ten movies
    top_ten_menu
  when 2
    # prompt for a specific movie then return info
  when 3
    # genre prompt then return info
  when 4
    #return family friendly movies
  when 5
    # prompt for an actor then return movies
  when 6
    # prompt for a director then return movies
  end
end


def cli_run
  # Greets the user with some nice art.
  greeting
  # Presents a menu of options and records the user's input
  input = menu
  # Chooses a next step based on the menu input
  menu_reader(input)
end

cli_run

# Presents a menu of options

# prompt.select("Choose a menu item?")

# - See top ten movies
# - Find information about a specific movie (enter movie name)
# - - Sub-menu?
# - Find movies in a certain genre
# - Find family-friendly movies
# - Find movies with a certain actor
# - Find movies with a certain director
