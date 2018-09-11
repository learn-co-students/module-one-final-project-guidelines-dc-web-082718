class Movie < ActiveRecord::Base
# A movie has one cast
# A movie has many actors through its cast
# A movie belongs to a director
# A movie belongs to a genre
  has_many :characters
  has_many :actors, through: :characters
  has_many :genre_movie_join_tables
  has_many :genres, through: :genre_movie_join_tables
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
    #TODO Print the movie date in a more legible fashion.
    puts "Entered theaters on #{release_date}."
  end

end
