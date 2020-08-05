class Api::V1::ForecastController < ApplicationController
   
    def index
        search_results = SearchResults.new
        geocode = Geocode.new
        @forecast = Forecast.new(search_results.forecast(geocode.latlng(params[:location])),geocode.city(params[:location]), geocode.country(params[:location]))
        render json: ForecastSerializer.new(@forecast)
    end 
end 
