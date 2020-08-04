class Munchie
    attr_reader :start_location, :end_location, :trave_time, :destination_forecast, :restaurant
    def initialize(start, destination, arrival_forecast)
        @start_location = start
        @end_location = destination
        @destination_forecast = arrival_forecast
        @restaurant = FoodService.new(destination)
    end 
end 