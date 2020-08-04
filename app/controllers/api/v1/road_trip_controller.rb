class Api::V1::RoadTripController < ApplicationController
    def index   
        search_results = SearchResults.new
        
        current_latlng = search_results.latlng(params[:origin])
        arrival_latlng = search_results.latlng(params[:destination])
        arrival_forecast = search_results.forecast_description(arrival_latlng)

        @road_trip = RoadTrip.new(search_results.city(params[:origin]), search_results.city(params[:destination]), arrival_forecast)
        render json: RoadTripSerializer.new(@road_trip)
    end 
end 