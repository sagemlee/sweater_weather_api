require 'rails_helper'

describe 'Road Trip Endpoint' do 
    it "will return successful response with correct API key" do
        
        post "/api/v1/users", params: {
        "email": "whatever@example.com",
        "password": "password",
        "password_confirmation": "password"
        }
        expect(response).to be_successful 
        api_key = response.body[:date][:attributes][:api_key]
            
        post "/api/v1/road_trip", params: {
            "origin": "Denver,CO",
            "destination": "Pueblo,CO",
            "api_key": "#{api_key}"
            }
        expect(response).to be_successful 
        road_trip = JSON.parse(response.body, symbolize_names: true)
        expect(road_trip[:data][:attributes][:origin]).to eq("Denver,CO")
        expect(road_trip[:data][:attributes][:destination]).to eq("Pueblo,CO")
        expect(road_trip[:data][:attributes][:travel_time]).to_not be_empty
        expect(road_trip[:data][:attributes][:arrival_forecast]).to_not be_empty

    end 

    it "will return error response with incorrect API key" do
        post "/api/v1/road_trip", params: {
            "origin": "Denver,CO",
            "destination": "Pueblo,CO",
            "api_key": "12343243124e"
            }
        expect(response.status).to eq(401)                 
    end 
end 