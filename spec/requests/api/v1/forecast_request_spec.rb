require 'rails_helper'

describe 'MapQuest API' do 
    it "sends latitude and longitude for specified city" do
        #, :vcr do 

     #post "/geocode/Denver,CO" 
    
    get "/api/v1/forecast", params: {location: "denver,co"}
    expect(response).to be_successful  
    
    forecast = JSON.parse(response.body)
    binding.pry
      
    expect(forecast).to eq ( )
     

    end 
end 