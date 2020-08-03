class ImageService 

    def conn
        Faraday.new("https://api.unsplash.com") do |faraday| 
            faraday.params["client_id"] = ENV["IMAGE_KEY"]
        end 
    end 
    
    def image(params)
        response = conn.get("/search/photos") do |f| 
            f.params["query"] = params
        end  
        json = JSON.parse(response.body, symbolize_names: true)
    end
end 