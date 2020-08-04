class Munchie
    attr_reader :start_location, :end_location, :travel_time, :destination_forecast, :restaurant, :id, :travel_time
    def initialize(start, destination, arrival_forecast, term)
        @food = FoodService.new
        @map = MapService.new
        @id = "null"
        @start_location = start
        @end_location = destination
        @destination_forecast = arrival_forecast
        @arrival_time_in_secs = @map.arrival_time(start, destination)
        @restaurant = @food.yelp(destination, term, @arrival_time_secs)
        @travel_time = @map.travel_time(start, destination)
    end 
end 