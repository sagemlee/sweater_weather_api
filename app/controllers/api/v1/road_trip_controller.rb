class Api::V1::RoadTripController < ApplicationController
    def index   
        binding.pry
        search_results = SearchResults.new

        arrival_latlng = search_results.latlng(params[:destination])
        arrival_forecast = search_results.forecast_description(search_results.latlng(params[:destination]))

        @road_trip = RoadTrip.new(search_results.city(params[:start]), search_results.city(params[:destination]), arrival_forecast)
        render json: RoadTripSerializer.new(@road_trip)
    end 
end 