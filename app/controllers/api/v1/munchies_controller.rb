class Api::V1::MunchiesController < ApplicationController
   
    def index
        search_results = SearchResults.new
        current_lat = search_results.lat(params[:end])
        current_lng = search_results.lng(params[:end])
        current_forecast = search_results.forecast(current_lat,current_lng)[:current][:weather].first[:description]
        arrival_lat = search_results.lat(params[:end])
        arrival_lng = search_results.lng(params[:end])
        arrival_forecast = search_results.forecast(current_lat,current_lng)[:current][:weather].first[:description] 
        food = Munchie.new(search_results.city(params[:start]), search_results.city(params[:end]), arrival_forecast, params[:food])
    end 
end 