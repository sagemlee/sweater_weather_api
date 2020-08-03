class SearchResults
    attr_reader :lat, :lng 
    def initialize
        @newmap =  MapService.new
        @weather = WeatherService.new
       
    end 

    def lat(location)
        @newmap.latlong(location)[:results].first[:locations].first[:latLng][:lat]
    end 

    def lng(location)
        @newmap.latlong(location)[:results].first[:locations].first[:latLng][:lng] 
    end

    def city(location)
        @newmap.latlong(location)[:results].first[:locations].first[:adminArea5] + "," +
        @newmap.latlong(location)[:results].first[:locations].first[:adminArea3] 
    end

    def country(location)
        @newmap.latlong(location)[:results].first[:locations].first[:adminArea1]
    end

    def forecast(lat,long)
        @weather.forecast(lat,long)
    end 
end 