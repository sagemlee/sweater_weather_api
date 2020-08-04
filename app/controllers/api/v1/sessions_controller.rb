class Api::V1::SessionsController < ApplicationController
    def create
        user = User.find_by(email: params[:email])
         if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            render json: UserSerializer.new(user), status: 200
         elsif user == nil
            render json:{errors: "Invalid Credentials", status: 400} 
         else
            render json: {errors: "Incorrect Password", status: 400}           
        end
    end 
end 