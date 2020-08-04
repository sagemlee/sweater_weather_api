class Api::V1::MunchiesController < ApplicationController
   
    def index
        search_results = SearchResults.new
        current_latlng = search_results.latlng(params[:end])
        current_forecast = search_results.forecast(current_latlng)[:current][:weather].first[:description]
        arrival_latlng = search_results.latlng(params[:end])
        arrival_forecast = search_results.forecast(current_latlng)[:current][:weather].first[:description] 
        @food = Munchie.new(search_results.city(params[:start]), search_results.city(params[:end]), current_forecast, arrival_forecast, params[:food])
        render json: MunchieSerializer.new(@food)
    end 
end 