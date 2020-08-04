require 'rails_helper'

describe 'Food Endpoint' do 
  it "returns food and forecast for a given location" do
  
      get "/api/v1/munchies", params: {
      "start": "denver,co",
      "end": "pueblo, co",
      "food": "chinese"
    }
    expect(response).to be_successful  
    food = JSON.parse(response.body, symbolize_names: true)
    binding.pry
    expect(food).to eq({
  "data": {
    "id": "null",
    "type": "munchie",
    "attributes": {
      "start_location": "Denver, CO",
      "end_location": "Pueblo, CO",
      "travel_time": "1 hours 48 min",
      "destination_forecast": {
        "current": "Cloudy with a chance of meatballs",
        "arrival": "Rain with a pastability of hail"
      },
      "restaurant": {
        "name": "All Night Asian Food",
        "address": "1234 Main St, Unit 12, Pueblo, CO 81009"
      }
    }
  }
})     
  end 
end 