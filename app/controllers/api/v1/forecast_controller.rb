class Api::V1::ForecastController < ApplicationController
   
    def index
        search_results = SearchResults.new
        lat = search_results.lat(params[:location])
        lng = search_results.lng(params[:location])

        @forecast = Forecast.new(search_results.forecast(lat, lng), search_results.image(params[:location]),search_results.city(params[:location]), search_results.country(params[:location]) )
        # @daily = Day.new(search_results.forecast(lat, lng))
        # @hourly = Hour.new(search_results.forecast(lat, lng))
         render json: ForecastSerializer.new(@forecast)
    end 
end 
