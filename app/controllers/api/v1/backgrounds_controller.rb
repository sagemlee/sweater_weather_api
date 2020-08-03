class Api::V1::BackgroundsController < ApplicationController
   
    def index
        @image = Image.new(params[:location])
        render json: ImageSerializer.new(@image)
    end 
end 
