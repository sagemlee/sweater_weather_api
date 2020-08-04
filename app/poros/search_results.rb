class SearchResults
    attr_reader :lat, :lng 
    def initialize
        @newmap =  MapService.new
        @weather = WeatherService.new
    end 

    def latlng(location)
        @newmap.latlong(location)[:results].first[:locations].first[:latLng]
    end 

    def city(location)
        @newmap.latlong(location)[:results].first[:locations].first[:adminArea5] + "," +
        @newmap.latlong(location)[:results].first[:locations].first[:adminArea3] 
    end

    def country(location)
        @newmap.latlong(location)[:results].first[:locations].first[:adminArea1]
    end

    def forecast(latlng)
        @weather.forecast(latlng[:lat],latlng[:lng])
    end 
end 