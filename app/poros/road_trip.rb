class RoadTrip
    attr_reader :id, :origin, :destination, :travel_time, :arrival_forecast
    def initialize(origin, destination, arrival_forecast)
        @id = "null"
        @map = MapService.new
        @origin = origin
        @destination = destination
        @travel_time = @map.travel_time(origin, destination)
        @arrival_forecast = arrival_forecast
    end 
end 