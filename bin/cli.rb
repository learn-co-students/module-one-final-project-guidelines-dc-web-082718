require_relative '../config/environment'
ActiveRecord::Base.logger = nil

def greeting
  system('clear')
  puts File.read('app/ascii/tomatr_ascii')
  puts "Welcome to Tomatr!"
  prompt = TTY::Prompt.new
  prompt.keypress("Press any key to continue.")
end

def menu
  system('clear')
  prompt = TTY::Prompt.new
  prompt.select("Choose a menu option?") do |menu|
    menu.choice 'See the top ten freshest movies in theaters', 1
    menu.choice "Find information about a specific movie", 2
    menu.choice "Find movies in a specific genre", 3
    menu.choice 'Find family-friendly movies', 4
    menu.choice 'Find movies starring a specific actor', 5
    menu.choice 'Find movies with a specific director', 6
    menu.choice 'Exit Tomatr', 7
  end
end

def return_to_menu?
  return_prompt = TTY::Prompt.new
  return_prompt.keypress("Press any key to return to the menu.")
  activate_menu
end

def titleize(string)
  string.split.map(&:capitalize).join(' ')
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
  puts "\n"
  prompt.yes?("Would you like to see more info about one of these movies?") do |q|
    q.suffix 'YES/NO'
    q.positive 'YES'
    q.negative 'NO'
  end
end

def top_ten_menu

  display_top_ten

  yesno = see_more_info?.upcase

  case yesno
  when "YES"
    movie = ask_for_movie
    puts "\n"
    put_movie_info(movie)
    return_to_menu?
  when "NO"
    return_to_menu?
  else
    return_to_menu?
  end

end

def ask_for_movie
  #TODO Did you mean...?
  prompt = TTY::Prompt.new
  prompt.ask("Enter the name of a movie.")
end

def put_movie_info(movie_name)
  # Accepts a movie name as a string and puts info about it if it exists
  formatted_movie_name = titleize(movie_name)
    if Movie.find_by(name: formatted_movie_name) != nil
      puts Movie.find_by(name: formatted_movie_name).info
    else
      puts 'That is not a valid movie. Returning to menu.'
      return_to_menu?
    end
end

def family_friendly_finder
  Movie.family_friendly.each do |movie|
    puts "#{movie.name}. #{movie.runtime} minute runtime. #{movie.certified_fresh?.capitalize}."
  end
end

def genre_prompter
  prompt = TTY::Prompt.new
  prompt.ask("Enter the name of a genre.")
end

def list_genres
  # Streamline?
  i = 1
  puts "Possible genre choices:"
  Genre.all.each do |genre|
    puts "#{i}. #{genre.name}"
    i += 1
  end
end

def find_movies_by_genre(genre)
  Genre.find_by(name: genre).movies
end

def genre_menu_method

  list_genres

  genre = titleize(genre_prompter)

  if Genre.find_by(name: genre) != nil
    movies = find_movies_by_genre(genre)
    movies.each do |movie|
      puts "#{movie.name}. #{movie.runtime} minute runtime. #{movie.certified_fresh?.capitalize}."
    end
  else
    puts "That is not a valid genre."
  end
end

def movie_objects_to_names(array)
  array.map { |movie| movie.name }
end

def actor_prompter
  prompt = TTY::Prompt.new
  prompt.ask("Enter the name of an actor.")
end

def find_movies_by_actor(actor)
  Actor.find_by(name: actor).movies
end

def actor_menu_method

  actor = titleize(actor_prompter)

  if Actor.find_by(name: actor) != nil
    # Finds movies by the actor and then turns them into an array of strings.
    movie_titles = movie_objects_to_names(find_movies_by_actor(actor))
    puts "#{actor} is currently starring in #{movie_titles.join(', ')}."
  else
    puts "That is not a valid actor."
  end
end

def director_prompter
  prompt = TTY::Prompt.new
  prompt.ask("Enter the name of a director.")
end

def find_movies_by_director(director)
  Director.find_by(name: director).movies
end

def director_menu_method
  # Asks for a director and titleizes her name
  director = titleize(director_prompter)

  if Director.find_by(name: director) != nil
    movie_titles = movie_objects_to_names(find_movies_by_director(director))
    puts "#{director} currently has out: #{movie_titles.join(', ')}."
  else
    puts "That is not a valid director."
  end
end

def menu_reader(input)
  case input
  when 1
    # top ten movies
    top_ten_menu
  when 2
    # prompt for a specific movie then return info
    put_movie_info(ask_for_movie)
    return_to_menu?
  when 3
    # genre prompt then return info
    genre_menu_method
    return_to_menu?
  when 4
    #return family friendly movies
    family_friendly_finder
    return_to_menu?
  when 5
    # prompt for an actor then return movies
    actor_menu_method
    return_to_menu?
  when 6
    # prompt for a director then return movies
    director_menu_method
    return_to_menu?
  when 7
    puts "Goodbye!"
  end
end

def activate_menu
  # Presents a menu of options and records the user's input
  input = menu
  # Chooses a next step based on the menu input
  menu_reader(input)
end

def cli_run
  # Greets the user with some nice art.
  greeting
  # Gets user input and chooses a next step
  activate_menu
end

cli_run

#TODO Why does Christopher Robin have a runtime of 0 minutes? Do any other movies
# have this issue?
