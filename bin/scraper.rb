require_relative '../config/environment'

# Loads a virtual browser which we will simulate each page inside.
# We cannot call Nokogiri directly on the page because it will not
# load dynamic javascript elements.
$browser = Watir::Browser.new

def drop_movie_data
  DatabaseCleaner.clean_with(:truncation, :only => ['movies', 'characters', 'actors', 'directors', 'genres', 'genre_movie_join_tables'])
end

def box_office_data_collector
  # Loads the box office page and scrapes it for HTML
  $browser.goto 'https://www.rottentomatoes.com/browse/in-theaters/'
  doc = Nokogiri::HTML.parse($browser.html)

  # Iterates over the front page to grab information about top grossing movies
  doc.css("div.mb-movie").each do |movie_box|

    title = movie_box.css("h3.movieTitle").text
    slug = title.downcase.gsub(/[^\w\s\d]/, '')
    score = movie_box.css("span.tMeterScore").text[0,2]
    url = movie_box.css("a").attr("href").value

    Movie.find_or_create_by(name: title, tomatometer: score, url: url, slug: slug)
  end
end

box_office_data_collector

def pull_cast_members(doc, movie)

  # Iterates over each cast member and creates a new
  # character, and actor if there is none.
  doc.css(".cast-item").each do |cast_member|

    # Pull the actor and character name from the CSS
    actor_name = cast_member.css("span").attr("title").value
    character_name = cast_member.css("span.characters").text.slice!(3..-1)
    actor_slug = actor_name.downcase.gsub(/[^\w\s\d]/, '')
    if character_name != nil
      character_slug = character_name.downcase.gsub(/[^\w\s\d]/, '')
    end

    # Find or create an actor based on the actor name pulled.
    actor = Actor.find_or_create_by(name: actor_name, slug: actor_slug)

    # Create a new character based on this actor and the character pulled.
    Character.find_or_create_by(name: character_name, actor_id: actor.id, movie_id: movie.id, slug: character_slug)

  end
end

def genre_array_parser(array, movie)
  # Find or create new genre objects from an array of strings
  # Associates the genres with the movie through a join table.
  # Returns an array of genres
  array.map do |genre_name|
    genre_slug = genre_name.downcase.gsub(/[^\w\s\d]/, '')
    genre = Genre.find_or_create_by(name: genre_name, slug: genre_slug)
    GenreMovieJoinTable.create(genre_id: genre.id, movie_id: movie.id)
    genre
  end
end

def find_or_create_genre_from(doc, movie)
  # If there are multiple genres, split them at the comma
  genre_array = doc.css("div.meta-value")[1].text.strip.split(',')
  # Remove leading space and new lines
  formatted_array = genre_array.map{|genre_name|genre_name = genre_name.gsub("\n","").strip}
  # Calls on the genre array parser documented above
  genre_array_parser(formatted_array, movie)

end

def find_or_create_director_from(doc)
  director_name = doc.css("div.meta-value")[2].text.strip
  director_slug = director_name.downcase.gsub(/[^\w\s\d]/, '')
  Director.find_or_create_by(name: director_name, slug: director_slug)
end

def format_release_date_from(doc)
  # This came with a buch of trash on the end so it needed to be formatted.
  release_date = doc.css("div.meta-value")[4].text.strip[0,11]
  release_date.slice!('\n wide')
  release_date
end

def pull_detailed_movie_info(doc, movie)

  # Calls on helper methods to deal with genre, director and release date
  find_or_create_genre_from(doc, movie)
  movie.director_id = find_or_create_director_from(doc).id
  movie.release_date = format_release_date_from(doc)

  # These are simple enough to deal with directly but we must check if the
  # field in question exists.
  if doc.css("div.meta-value").first != nil
    movie.rating = doc.css("div.meta-value").first.text.split.first
  end
  if doc.css("div.meta-value")[3] != nil
    movie.writer = doc.css("div.meta-value")[3].text.strip
  end
  if doc.css("div.meta-value")[5] != nil
    movie.runtime = doc.css("div.meta-value")[5].text.strip.to_i
  end
  if doc.css("div.meta-value")[6] != nil
    movie.studio = doc.css("div.meta-value")[6].text.strip
  end
  if doc.css("p.critic_consensus") != nil
    movie.critic_consensus = doc.css("p.critic_consensus").text.split("\n")[2].strip
  end

  movie.save

end

def movie_data_collector(movie)

  url = "https://www.rottentomatoes.com" + movie.url

  # Directs the browser to the URL of our movie.
  $browser.goto url
  doc = Nokogiri::HTML.parse($browser.html)

  # Calls the pull_cast_members method to make new characters
  # and potentially new actors from the movie page
  pull_cast_members(doc, movie)

  # Collects additional information about the movie
  pull_detailed_movie_info(doc, movie)

  movie

end

def full_scraper

  drop_movie_data

  # Collects basic data about the box office from the front page
  box_office_data_collector

  # Iterates over each movie to collect additional data, including
  # information about actors and characters.
  Movie.all.map do |movie|
    movie_data_collector(movie)
  end

end

full_scraper
