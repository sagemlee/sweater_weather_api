class MapService 

    def conn
        Faraday.new("http://www.mapquestapi.com") do |faraday| 
            faraday.params["key"] = ENV["MAPQUEST_KEY"]
        end 
    end 
    
    def latlong(params)
        response = conn.get("geocoding/v1/address") do |f| 
            f.params["location"] = params
        end  
        json = JSON.parse(response.body, symbolize_names: true)
        json[:results].first[:locations].first[:latLng]
    end
end 