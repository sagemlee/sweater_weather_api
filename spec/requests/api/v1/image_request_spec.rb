require 'rails_helper'

describe 'Image Endpoint' do 
    it "returns image url" do
  
    get "/api/v1/backgrounds", params: {location: "denver,co"}
    expect(response).to be_successful  
    
    image = JSON.parse(response.body, symbolize_names: true)
    expect(image[:data][:attributes][:url]).to_not be_empty
    end 
end 