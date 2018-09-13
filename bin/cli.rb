require_relative '../config/environment'
ActiveRecord::Base.logger = nil

def greeting
  system('clear')
  puts File.read('app/ascii/tomatr_ascii')
  puts "Welcome to Tomatr!"
  prompt = TTY::Prompt.new
  prompt.keypress("Press any key to continue.")
end

# Login menu methods

def activate_login_menu
  system('clear')
  input = get_login_menu_input
  login_menu_reader(input)
end

def get_login_menu_input
  prompt = TTY::Prompt.new
  prompt.select("Sign in or create a user.") do |menu|
    menu.choice 'Sign in', 1
    menu.choice 'Create user', 2
  end
end

def login_menu_reader(input)
  case input
  when 1
    sign_in
  when 2
    create_user
  end
end

def create_user
  username = ask_for_username
  password = ask_for_password
  name = ask_for_name
  age = ask_for_age
  User.create(username: username, password: password, name: name, age: age)
  return_to_login_menu?
  activate_login_menu
end

def ask_for_name
  prompt = TTY::Prompt.new
  prompt.ask("Please enter your name.", required: true)
end

def ask_for_age
  prompt = TTY::Prompt.new
  prompt.ask("Please enter your age.", required: true)
end

def return_to_login_menu?
  return_prompt = TTY::Prompt.new
  return_prompt.keypress("Press any key to go back.")
end

def continue_to_main_menu
  prompt = TTY::Prompt.new
  prompt.keypress("Press any key to continue.")
  activate_main_menu
end

def valid_user?(username, password)
  User.exists?(username: username, password: password)
end

def sign_in
  username = ask_for_username
  password = ask_for_password
  if valid_user?(username, password) == true
    $current_user = User.find_by(username: username, password: password)
    welcome_user
    continue_to_main_menu
  else
    puts "That is not a valid username/password combination."
    return_to_login_menu?
    activate_login_menu
  end
end

def ask_for_username
  prompt = TTY::Prompt.new
  prompt.ask("Please enter your username.", required: true)
end

def ask_for_password
  prompt = TTY::Prompt.new
  prompt.mask("Please enter your password.", required: true)
end

def welcome_user
  puts "Welcome, #{$current_user.name}!"
end

# Main menu methods

def return_to_main_menu?
  return_prompt = TTY::Prompt.new
  return_prompt.keypress("Press any key to return to the menu.")
  activate_main_menu
end

def slugify(string)
  string.downcase.gsub(/[^\w\s\d]/, '')
end

def display_top_ten
  system('clear')
  $top_ten = Movie.top_ten
  puts "Today's top ten freshest movies are:"
  puts "1. #{$top_ten[0].name}"
  puts "2. #{$top_ten[1].name}"
  puts "3. #{$top_ten[2].name}"
  puts "4. #{$top_ten[3].name}"
  puts "5. #{$top_ten[4].name}"
  puts "6. #{$top_ten[5].name}"
  puts "7. #{$top_ten[6].name}"
  puts "8. #{$top_ten[7].name}"
  puts "9. #{$top_ten[8].name}"
  puts "10. #{$top_ten[9].name}"
end

def see_more_info?
  prompt = TTY::Prompt.new
  puts "\n"
  prompt.yes?("Would you like to see more info about one of these movies?", default: "NO") do |q|
    q.suffix 'YES/NO'
    q.positive 'YES'
    q.negative 'NO'
  end
end

def top_ten_response_reader(response)

  case response
  when "1"
    puts $top_ten[0].info
  when "2"
    puts $top_ten[1].info
  when "3"
    puts $top_ten[2].info
  when "4"
    puts $top_ten[3].info
  when "5"
    puts $top_ten[4].info
  when "6"
    puts $top_ten[5].info
  when "7"
    puts $top_ten[6].info
  when "8"
    puts $top_ten[7].info
  when "9"
    puts $top_ten[8].info
  when "10"
    puts $top_ten[9].info
  else
    put_movie_info(response)
  end
end

def top_ten_menu

  display_top_ten

  yesno = see_more_info?.upcase

  case yesno
  when "YES"
    response = ask_for_top_ten_movie
    puts "\n"
    top_ten_response_reader(response)
  end

end

def ask_for_movie
  prompt = TTY::Prompt.new
  prompt.ask("Enter the name of a movie.", required: true)
end

def ask_for_top_ten_movie
  prompt = TTY::Prompt.new
  prompt.ask("Enter the name or number of a movie.", required: true)
end

def invalid_movie_helper(movie_slug)
  matches = Movie.all.select{|movie| movie.slug.include?(movie_slug)}
  if matches != []
    puts 'That is not a valid movie. Did you mean...'
    matches.each {|movie| puts movie.name}
  else
    puts 'That is not a valid movie.'
  end
end

def invalid_actor_helper(actor_slug)
  matches = Actor.all.select{|actor| actor.slug.include?(actor_slug)}
  if matches != []
    puts 'That is not a valid actor. Did you mean...'
    matches.each {|actor| puts actor.name}
  else
    puts 'That is not a valid actor.'
  end
end

def invalid_director_helper(director_slug)
  matches = Director.all.select{|director| director.slug.include?(director_slug)}
  if matches != []
    puts 'That is not a valid director. Did you mean...'
    matches.each {|director| puts director.name}
  else
    puts 'That is not a valid director.'
  end
end

def invalid_genre_helper(genre_slug)
  matches = Genre.all.select{|genre| genre.slug.include?(genre_slug)}
  if matches != []
    puts 'That is not a valid genre. Did you mean...'
    matches.each {|genre| puts genre.name}
  else
    puts 'That is not a valid genre.'
  end
end

def want_to_see_cast?(movie)
  prompt = TTY::Prompt.new
  yesno = prompt.yes?("Would you like to see info about the cast?", default: "NO") do |q|
    q.suffix 'YES/NO'
    q.positive 'YES'
    q.negative 'NO'
  end
  case yesno.upcase
  when "YES"
    puts "\n"
    puts movie.cast_info
  end
end

def want_to_see_reviews?(movie)
  prompt = TTY::Prompt.new
  yesno = prompt.yes?("Would you like to see some reviews about this movie?", default: "NO") do |q|
    q.suffix 'YES/NO'
    q.positive 'YES'
    q.negative 'NO'
  end
  case yesno.upcase
  when "YES"
    puts "\n"
    movie.three_random_reviews
  end
end

def put_movie_info(movie_name)
  # Accepts a movie name as a string and puts info about it if it exists

  movie_slug = slugify(movie_name)

  if Movie.find_by(slug: movie_slug) != nil
    movie = Movie.find_by(slug: movie_slug)
    puts movie.info
    want_to_see_cast?(movie)
    want_to_see_reviews?(movie)
  else
    invalid_movie_helper(movie_slug)
  end
end

def family_friendly_finder
  Movie.family_friendly.each do |movie|
    if movie.runtime == 0
      puts "#{movie.name}. #{movie.certified_fresh?.capitalize}."
    else
      puts "#{movie.name}. #{movie.runtime} minute runtime. #{movie.certified_fresh?.capitalize}."
    end
  end
end

def genre_prompter
  prompt = TTY::Prompt.new
  prompt.ask("Enter the name of a genre.", required: true)
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

def find_movies_by_genre(genre_slug)
  Genre.find_by(slug: genre_slug).movies
end

def genre_menu_method

  list_genres

  genre = genre_prompter
  genre_slug = slugify(genre)

  if Genre.find_by(slug: genre_slug) != nil
    movies = find_movies_by_genre(genre_slug)
    movies.each do |movie|
      if movie.runtime == 0
        puts "#{movie.name}. #{movie.certified_fresh?.capitalize}."
      else
        puts "#{movie.name}. #{movie.runtime} minute runtime. #{movie.certified_fresh?.capitalize}."
      end
    end
  else
    invalid_genre_helper(genre_slug)
  end
end

def movie_objects_to_names(array)
  array.map { |movie| movie.name }
end

def actor_prompter
  prompt = TTY::Prompt.new
  prompt.ask("Enter the name of an actor.", required: true)
end

def find_movies_by_actor(actor_slug)
  Actor.find_by(slug: actor_slug).movies
end

def actor_menu_method

  actor = actor_prompter
  actor_slug = slugify(actor)

  if Actor.find_by(slug: actor_slug) != nil
    # Finds movies by the actor and then turns them into an array of strings.
    movie_titles = movie_objects_to_names(find_movies_by_actor(actor_slug))
    puts "#{actor} is currently starring in #{movie_titles.join(', ')}."
  else
    invalid_actor_helper(actor_slug)
  end

end

def director_prompter
  prompt = TTY::Prompt.new
  prompt.ask("Enter the name of a director.", required: true)
end

def find_movies_by_director(director_slug)
  Director.find_by(slug: director_slug).movies
end

def director_menu_method

  director = director_prompter
  director_slug = slugify(director)

  if Director.find_by(slug: director_slug) != nil
    puts "#{director} currently has the following movies in theaters:"
    movies = find_movies_by_director(director_slug)
    movies.each{|movie| puts movie.name}
  else
    invalid_director_helper(director_slug)
  end
end

def main_menu
  system('clear')
  puts File.read('app/ascii/tomatr_ascii')
  puts "Hello, #{$current_user.name}!"
  prompt = TTY::Prompt.new
  prompt.select("Choose a menu option?") do |menu|
    menu.choice 'See the top ten freshest movies in theaters', 1
    menu.choice "Find information about a specific movie", 2
    menu.choice "Find movies in a specific genre", 3
    menu.choice 'Find family-friendly movies', 4
    menu.choice 'Find movies starring a specific actor', 5
    menu.choice 'Find movies with a specific director', 6
    menu.choice 'Leave a review', 7
    menu.choice 'Exit Tomatr', 8
  end
end

def menu_reader(input)
  case input
  when 1
    # top ten movies
    top_ten_menu
    return_to_main_menu?
  when 2
    # prompt for a specific movie then return info
    put_movie_info(ask_for_movie)
    return_to_main_menu?
  when 3
    # genre prompt then return info
    genre_menu_method
    return_to_main_menu?
  when 4
    #return family friendly movies
    family_friendly_finder
    return_to_main_menu?
  when 5
    # prompt for an actor then return movies
    actor_menu_method
    return_to_main_menu?
  when 6
    # prompt for a director then return movies
    director_menu_method
    return_to_main_menu?
  when 7
    review_menu_execute
    return_to_main_menu?
  when 8
    puts "Come back again soon!"
  end
end

def activate_main_menu
  # Presents a menu of options and records the user's input
  input = main_menu
  # Chooses a next step based on the menu input
  menu_reader(input)
end

# Review methods

def review_menu_execute
  which_movie_to_review?
end

def which_movie_to_review?
  movie_name = ask_for_movie
  movie_slug = slugify(movie_name)
  if Movie.find_by(slug: movie_slug) != nil
    movie = Movie.find_by(slug: movie_slug)
    create_review(movie)
  else
    invalid_movie_helper(movie_slug)
  end
end

def ask_for_review_content
  prompt = TTY::Prompt.new
  prompt.ask("Please enter the text of your review.", required: true)
end

def create_review(movie)
  content = ask_for_review_content
  Review.create(user_id: $current_user.id, movie_id: movie.id, content: content)
end

# CLI methods

def cli_run
  greeting
  activate_login_menu
end

cli_run
