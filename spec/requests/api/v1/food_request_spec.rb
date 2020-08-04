require 'rails_helper'

describe 'Food Endpoint' do 
  it "returns food and forecast for a given location" do
  
      post "/api/v1/munchies", params: {
      "start": "denver,co",
      "end": "pueblo, co",
      "food": "chinese"
    }
    expect(response).to be_successful  
    food = JSON.parse(response.body, symbolize_names: true)
    expect(food).to eq({
  "data": {
    "id": "null",
    "type": "munchie",
    "attributes": {
      "start_location": "Denver, CO",
      "end_location": "Pueblo, CO",
      "destination_forecast": {
        "current": "Cloudy with a chance of meatballs"
      },
      "restaurant": {
        "name": "Chinese Restaurant",
        "address": "4602 N. Elizabeth St, Ste 120, Pueblo, CO 81008"
      }
    }
  }
})     
  end 
end 