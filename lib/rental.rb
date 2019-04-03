require_relative 'date_range'
require 'time'
require_relative 'movie'


module GreenBox
  class Rental
    attr_accessor :date_range, :movie, :customer

    def initialize(date_range, movie, customer)
      if date_range.nights < 1
        raise ArgumentError.new "Please enter a valid date range."
      end
      @movie = movie
      @date_range = date_range
      @customer = customer
    end

    def cost
      rent = @date_range.nights
      cost = rent * 3.0
      return cost.round(2)
    end
  end
end