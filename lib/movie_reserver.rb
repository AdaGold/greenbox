require 'csv'
require 'pry'
require_relative 'date_range'
require_relative 'movie'
require_relative 'rental'


module GreenBox
  class MovieReserver
    attr_accessor :movies, :rentals, :date_range
    # :reserver, :date_range

    def initialize
      @movies = MovieReserver.load_movies
      @rentals = []
      @date_range = GreenBox::DateRange.new(Time.parse('2018-08-08'),Time.parse('2018-08-09'))
    end

      # `self.load_movies`: This method will open the csv file `movies.csv` and read in the movies and return an array of the given movies.  Note the actors are separated by the `:` character.  You will need to break up that field.
    def self.load_movies
      showtime_movies  = []

      CSV.read('data/movies.csv', headers: false).each do |line|
        movie_id = line[0].to_i
        title = line[1]
        publisher = line[2]
        all_actors = line[3]
        actors_names = all_actors.split(':')
        actors = {actors: actors_names}

        showtime_movies << GreenBox::Movie.new(movie_id, title, publisher, actors)
      end
      return showtime_movies
    end
    def available_movies(date_range)
      if @rentals.empty?
        return @movies
      else
        available_movies = []
        @movies.each do |movie|
          if @rentals.date_range == date_range
            available_movies << movie
          end
        end
        return @rentals
      end
  end
  def rent_movie(movie_title, date_range, customer_name)
    @movies.each do |movie|
      if movie.title == movie_title
        @rentals << movie
        return @rentals
      end
    end
    raise ArgumentError.new("No movie available.")
  end
end





