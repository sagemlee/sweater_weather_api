def conn 
        Faraday.new(url:("https://api.yelp.com/")) do |faraday| 
            faraday.adapter Faraday.default_adapter
            faraday.authorization :Bearer, ENV["YELP_KEY"]
            faraday.headers["Authorization"] 
        end 
    end 
    def yelp(location)
        response = conn.get("v3/businesses/search") do |f|
            f.params["location"] = location
        end 
    JSON.parse(response.body, symbolize_names: true)
       binding.pry
    end