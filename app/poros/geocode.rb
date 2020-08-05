class Geocode
    def initialize
        @geocode = MapService.new
    end 

    def latlng(location)
        @geocode.latlong(location)[:results].first[:locations].first[:latLng]
    end  

    def city(location)
        @geocode.latlong(location)[:results].first[:locations].first[:adminArea5] + "," +
        @geocode.latlong(location)[:results].first[:locations].first[:adminArea3] 
    end

    def country(location)
        @geocode.latlong(location)[:results].first[:locations].first[:adminArea1]
    end
end 