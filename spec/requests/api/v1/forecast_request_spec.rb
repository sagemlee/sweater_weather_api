require 'rails_helper'

describe 'Map service' do 
    it "returns latitude and logitude" do
  
    location = SearchResults.new 
    expect(location.latlng("Denver,CO")).to eq({"lat": 39.738453, "lng": -104.984853})
    expect(location.city("Denver,CO")).to eq("Denver,CO")
    expect(location.country("Denver,CO")).to eq("US")

    get "/api/v1/forecast", params: {location: "denver,co"}
    expect(response).to be_successful  
    
    forecast = JSON.parse(response.body)   
    end 
end 