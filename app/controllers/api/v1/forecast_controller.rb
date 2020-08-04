class Api::V1::ForecastController < ApplicationController
   
    def index
        search_results = SearchResults.new
        latlng = search_results.latlng(params[:location])

        @forecast = Forecast.new(search_results.forecast(latlng),search_results.city(params[:location]), search_results.country(params[:location]))
        render json: ForecastSerializer.new(@forecast)
    end 
end 
