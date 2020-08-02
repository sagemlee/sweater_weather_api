class SearchController < ApplicationController
    def index
        search_results = SearchResults.new
        @lat = search_results.lat(params[:location])
        @lng = search_results.lng(params[:location])

        @forecast = search_results.forecast(@lat, @lng)
        binding.pry  
    end 
end 
