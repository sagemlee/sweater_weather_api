class Api::V1::ForecastController < ApplicationController
    def index 
        bob = render json: ForecastSerializer.new(Forecast.new(params[:location]))
    end 

end 
