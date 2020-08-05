class RoadTrip
    attr_reader :id, :origin, :destination, :travel_time, :arrival_forecast
    def initialize(origin, destination, arrival_forecast)
        @id = "null"
        @origin = origin
        @destination = destination
        @travel_time = format_time
        @arrival_forecast = arrival_forecast
    end 

    private 

    def format_time
        map = MapService.new
        map.travel_time(origin, destination)[:route][:formattedTime].to_time.strftime("%-H hours %M minutes")
    end 
end 