class GeocodeController < ApplicationController
    def index 
        conn = Faraday.new("http://www.mapquestapi.com") do |faraday| 
            faraday.params["key"] = env[MAPQUEST_KEY]
        end 

        response = conn.get("geocoding/v1/address") do |f| 
            f.params["location"] = params[:location]
        end  

        json = JSON.parse(response.body, symbolize_names: true)
        binding.pry
        @geocode = json[:results].first[:locations].first[:latLng]

    end 
end 
