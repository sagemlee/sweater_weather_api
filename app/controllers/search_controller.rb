class SearchController < ApplicationController
    def index
        search_results = SearchResults.new
        lat = search_results.lat(params[:location])
        lng = search_results.lng(params[:location])

        @forecast = Forecast.new(search_results.forecast(lat, lng))
        @daily = Day.new(search_results.forecast(lat, lng))
        @hourly = Hour.new(search_results.forecast(lat, lng))
        render json: ForecastSerializer.new(@forecast, @daily, @hourly)
    end 
end 
