class Api::V1::RoadTripController < ApplicationController
    def index   
        if key = User.find_by(api_key: params[:api_key])
            search_results = SearchResults.new
            geocode = Geocode.new
            
            current_latlng = geocode.latlng(params[:origin])
            arrival_latlng = geocode.latlng(params[:destination])
            arrival_forecast = search_results.forecast_description(arrival_latlng)

            @road_trip = RoadTrip.new(geocode.city(params[:origin]), geocode.city(params[:destination]), arrival_forecast)
            render json: RoadTripSerializer.new(@road_trip)
        else 
            render json: "Request must include valid API Key", status: 401
        end 
    end 
end 