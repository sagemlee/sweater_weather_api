class Api::V1::MunchiesController < ApplicationController
   
    def index
        search_results = SearchResults.new

        current_latlng = search_results.latlng(params[:start])
        current_forecast = search_results.forecast_description(current_latlng)
        arrival_latlng = search_results.latlng(params[:end])
        arrival_forecast = search_results.forecast_description(arrival_latlng)

        @food = Munchie.new(search_results.city(params[:start]), search_results.city(params[:end]), current_forecast, arrival_forecast, params[:food])
        render json: MunchieSerializer.new(@food)
    end 
end 