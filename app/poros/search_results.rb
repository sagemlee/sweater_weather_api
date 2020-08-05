class SearchResults
    attr_reader :lat, :lng 
    def initialize
        @weather = WeatherService.new
    end 

    def forecast(latlng)
        @weather.forecast(latlng[:lat],latlng[:lng])
    end 
    
    def forecast_description(latlng)
        @weather.forecast(latlng[:lat],latlng[:lng])[:current][:weather].first[:description]
    end 
end 