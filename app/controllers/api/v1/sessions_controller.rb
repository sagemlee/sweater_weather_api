class Api::V1::SessionsController < ApplicationController
    def create
        user = User.find_by(email: params[:email])
        binding.pry
         if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            render json: UserSerializer.new(user), status: 200
        else
            render json: {errors: user.errors.full_messages, status: 400}           
        end
    end 
end 