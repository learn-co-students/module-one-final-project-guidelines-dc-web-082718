class Movie < ActiveRecord::Base
# A movie has one cast
# A movie has many actors through its cast
# A movie belongs to a director
# A movie belongs to a genre
  has_many :characters
  has_many :actors, through: :characters
  has_many :genre_movie_join_tables
  has_many :genres, through: :genre_movie_join_tables
  has_many :reviews
  belongs_to :director

  # Class Methods

  def self.order_by_tomatometer
    # Orders all movie by tomato rating
    order(tomatometer: :desc)
  end

  def self.top_ten
    # Just returns the top ten highest rated movies
    order_by_tomatometer.first(10)
  end

  def self.worst
    # Returns the movie with the lowest rating.
    order_by_tomatometer.last
  end

  def self.family_friendly
    #TODO This is pretty ugly, definitely should be refactored, but
    # I was struggling to get it to work with higher level methods
    array = []
    all.map do |movie|
      movie.genres.each do |genre|
        if genre.name == 'Kids & Family'
          array << movie
        end
      end
    end
    array
  end

  # Instance Methods

  def certified_fresh?
    if(tomatometer >= 75)
      "certified fresh"
    elsif(tomatometer < 75 && tomatometer >= 60)
      "fresh"
    else
      "certified rotten"
    end
  end

  def info
    puts "#{name} is rated #{rating}."
    puts "#{name} is #{certified_fresh?}!"
    puts "#{name} has a runtime of #{runtime} minutes."
    puts "Directed by #{director.name}."
    puts "Written by #{writer}."
    puts "Critical consensus: #{critic_consensus}"
    #TODO Print the movie date in a more legible fashion.
    puts "Entered theaters on #{release_date}."
  end

  def cast_info
    puts "#{name} stars:"
    puts "#{actors[0].name} as #{characters[0].name},"
    puts "#{actors[1].name} as #{characters[1].name}"
    puts "and #{actors[2].name} as #{characters[2].name}"
  end

  def three_random_reviews
    three_reviews = reviews.limit(3).order("RANDOM()")

    if three_reviews.length == 0
      puts "There are no user reviews for this movie"
    end

    if three_reviews.length >= 1
      puts "#{three_reviews[0].user.name} said: "
      print "#{three_reviews[0].content}"
    end

    if three_reviews.length >= 2
      puts "#{three_reviews[1].user.name} said: "
      print "#{three_reviews[1].content}"
    end

    if three_reviews.length >= 3
      puts "#{three_reviews[2].user.name} said: "
      puts "#{three_reviews[2].content}"
    end

  end

end
