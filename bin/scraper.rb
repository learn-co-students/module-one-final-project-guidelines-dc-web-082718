require_relative '../config/environment'

# Loads a virtual browser which we will simulate each page inside.
# We cannot call Nokogiri directly on the page because it will not
# load dynamic javascript elements.
$browser = Watir::Browser.new

def box_office_data_collector
  # Loads the box office page and scrapes it for HTML
  $browser.goto 'https://www.rottentomatoes.com/browse/in-theaters/'
  doc = Nokogiri::HTML.parse($browser.html)

  # Iterates over the front page to grab information about top grossing movies
  doc.css("div.mb-movie").each do |movie_box|

    # Grabs the title, Tomatometer score and URL of a movie
    title = movie_box.css("h3.movieTitle").text
    score = movie_box.css("span.tMeterScore").text[0,2]
    url = movie_box.css("a").attr("href").value

    # Turns that movie into a new class object
    Movie.create(name: title, tomatometer: score, url: url)
  end
end

box_office_data_collector

def pull_cast_members(doc)
  # This method will be placed inside the movie page scraper later.

  # Iterates over each cast member and creates a new
  # character, and actor if there is none.
  doc.css(".cast-item").each do |cast_member|

    # Pull the actor and character name from the CSS
    actor_name = cast_member.css("span").attr("title").value
    character_name = cast_member.css("span.characters").text.slice!(3..-1)

    # Find or create an actor based on the actor name pulled.
    actor = Actor.find_or_create_by(name: actor_name)

    # Create a new character based on this actor and the character pulled.
    Character.find_or_create_by(name: character_name, actor_id: actor.id)

  end
end

def pull_detailed_movie_info(doc)

  #TODO Here is all the pulled data. This needs to be added to a
  # movie object in the database.
  rating = doc.css("div.meta-value").first.text[0]
  genre = doc.css("div.meta-value")[1].text.strip
  director = doc.css("div.meta-value")[2].text.strip
  writer = doc.css("div.meta-value")[3].text.strip
  in_theaters = doc.css("div.meta-value")[4].text.strip[0,11]
  in_theaters.slice!('\n wide')
  runtime = doc.css("div.meta-value")[5].text.strip.to_i
  studio = doc.css("div.meta-value")[6].text.strip

end

def movie_data_collector(url)

  # Ultimately this will accept a movie object and then
  # use its url extension to find movies. Right now it's not doing that for
  # testing purposes.
  # url = "https://www.rottentomatoes.com" + movie.url

  # Directs the browser to the URL of our movie.
  $browser.goto url
  doc = Nokogiri::HTML.parse($browser.html)

  # Calls the pull_cast_members method to make new characters
  # and potentially new actors from the movie page
  pull_cast_members(doc)

  # Collects additional information about the movie, including
  # runtime, genre (find or creating a genre), director
  # (find or creating a director), and rating (like how spoopy and adult it is)
  pull_detailed_movie_info(doc)

end

movie_data_collector("https://www.rottentomatoes.com/m/the_nun_2018")

def full_scraper

  # Collects basic data about the box office from the front page
  box_office_data_collector

  # Iterates over each movie to collect additional data, including
  # information about actors and characters.
  Movie.all.each do |movie|
    movie_data_collector(movie)
  end

end
