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
    
    expect(food[:data][:id]).to eq("null")
    expect(food[:data][:type]).to eq("munchie")
    expect(food[:data][:attributes][:start_location]).to eq("Denver,CO")
    expect(food[:data][:attributes][:end_location]).to eq("Pueblo,CO")
    expect(food[:data][:attributes][:travel_time]).to_not be_empty
    expect(food[:data][:attributes][:destination_forecast][:current]).to_not be_empty
    expect(food[:data][:attributes][:destination_forecast][:current]).to_not be_empty
    expect(food[:data][:attributes][:restaurant][:name]).to_not be_empty
    expect(food[:data][:attributes][:restaurant][:address]).to_not be_empty
    
    binding.pry  
   
#   get "/api/v1/munchies", params: {
#       "start": "denver,co",
#       "food": "chinese"
#     }  

#     bad_food = JSON.parse(response.body, symbolize_names: true)
 
  end 
end 