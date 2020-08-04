class FoodService
    def conn 
        Faraday.new(url:("https://api.yelp.com/")) do |faraday| 
            faraday.adapter Faraday.default_adapter
            faraday.authorization :Bearer, ENV["YELP_KEY"]
            faraday.headers["Authorization"] 
        end 
    end 
        
    def yelp(location, term, arrival_time)
        response = conn.get("v3/businesses/search") do |f|
            f.params["location"] = location
            f.params["term"] = term
            f.params["open_at"] = arrival_time
        end 
        food = JSON.parse(response.body, symbolize_names: true)
        address = food[:businesses].first[:location][:display_address].join(", ")
        restaurant = {"name": food[:businesses].first[:name], "address": address}
        restaurant
    end
end 