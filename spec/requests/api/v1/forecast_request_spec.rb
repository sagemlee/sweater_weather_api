require 'rails_helper'

describe 'MapQuest API' do 
    it "sends latitude and longitude for specified city" do 
    
      get "/api/v1/forecast", params: {location: "denver,co"}

      expect(response).to be_successful  

      forecast = JSON.parse(response.body)
      expect(forecast).to eq ( )
     

    end 
end 