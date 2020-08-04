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
        JSON.parse(response.body, symbolize_names: true)
    end

    def travel_time(start, destination)
        response = conn.get("directions/v2/route") do |f| 
            f.params["from"] = start
            f.params["to"] = destination
        end  
        route = JSON.parse(response.body, symbolize_names: true)
        time = route[:route][:realTime]
        mm, ss = time.divmod(60)
        hh, mm = mm.divmod(60)  
        "%d hours %d minutes" % [hh, mm]
    end 

    def arrival_time(start, destination)
        response = conn.get("directions/v2/route") do |f| 
            f.params["from"] = start
            f.params["to"] = destination
        end  
        route = JSON.parse(response.body, symbolize_names: true)
        time = route[:route][:realTime]

        Time.now.to_i + time 
    end 
end 