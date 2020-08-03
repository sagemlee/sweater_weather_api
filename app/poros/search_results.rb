class SearchResults
    attr_reader :lat, :lng 
    def initialize
        @newmap =  MapService.new
        @weather = WeatherService.new
    end 

    def lat(location)
        @newmap.latlong(location)[:lat]

    end 
    def lng(location)
        @newmap.latlong(location)[:lng]
    end

    def forecast(lat,long)
        @weather.forecast(lat,long)
    end 

    def current_info(lat,long)
      @weather.forecast(lat,long)[:current]

    end 

    def hourly_info(lat,long)
        binding.pry
        @weather.forecast(lat,long)[:hourly][0..7]
    end 

    def daily_info(lat,long)
        
        @weather.forecast(lat,long)[:daily][0..4]
    end  

end 