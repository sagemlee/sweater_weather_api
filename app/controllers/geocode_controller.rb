class GeocodeController < ApplicationController
    def index
        search_results = SearchResults.new
        @lat = "39"
        @lng = "-104"
        # @lat = search_results.lat(params[:location])
        # @lng = search_results.lng(params[:location])

        @forecast = search_results.forecast(@lat, @lng)
# json[:results].first[:locations].first[:latLng]
#         WeatherService.new(@geocode)
    end 
end 
