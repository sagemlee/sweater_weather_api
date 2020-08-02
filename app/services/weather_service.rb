class WeatherService 
    def conn 
        Faraday.new(url:("https://api.openweathermap.org/")) do |faraday| 
            faraday.adapter Faraday.default_adapter
            faraday.params["appid"] = ENV["WEATHER_KEY"]
        end 
    end 

    def forecast(lat, long)
        binding.pry
        response = conn.get("data/2.5/onecall") do |f|
            f.params["lat"] = lat
            f.params["lon"] = long
        end 
        weather_json = JSON.parse(response.body, symbolize_names: true)
        binding.pry
    end 
end 