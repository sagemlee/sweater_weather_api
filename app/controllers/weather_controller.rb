 class WeatherController < ApplicationController

    weather_conn = Faraday.new("http://www.api.openweathermap.org") do |faraday| 
                faraday.params["appid"] = ENV["WEATHER_KEY"]
                end 
            binding.pry
                weather_response = weather_conn.get("data/2.5/onecall") do |f|
                    f.params["lat"] = @geocode.lat
                    f.params["lon"] = @geocode.lng
                end 
            weather_json = JSON.parse(weather_response.body, symbolize_names: true)
            binding.pry

    end 