class MapService 

    def latlong(params)
        response = conn.get("geocoding/v1/address") do |f| 
            f.params["location"] = params
        end  
        JSON.parse(response.body, symbolize_names: true)
    end

    def travel_time(start, destination)
        response = conn.get("directions/v2/route") do |f| 
            f.params["from"] = start
            f.params["to"] = destination
        end  
        JSON.parse(response.body, symbolize_names: true)
    end

    private 

    def conn
        Faraday.new("http://www.mapquestapi.com") do |faraday| 
            faraday.params["key"] = ENV["MAPQUEST_KEY"]
        end 
    end 
end 