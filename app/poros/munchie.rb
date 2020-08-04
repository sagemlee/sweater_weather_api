class Munchie
    attr_reader :start_location, :end_location, :travel_time, :destination_forecast, :restaurant
    def initialize(start, destination, arrival_forecast, term)
        @start_location = start
        @end_location = destination
        @destination_forecast = arrival_forecast
        @restaurant = FoodService.new.yelp(destination, term)
    end 
end 