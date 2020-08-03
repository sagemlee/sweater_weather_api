class SearchResults
    attr_reader :lat, :lng 
    def initialize
        @newmap =  MapService.new
        @weather = WeatherService.new
        @image = ImageService.new
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

    def image(query)
        @image.image(query)
    end 
end 