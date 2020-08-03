require 'rails_helper'

describe 'Image Serializer' do 
    it "returns image url" do
  
    get "/api/v1/backgrounds", params: {location: "denver,co"}
    expect(response).to be_successful  
    
    image = JSON.parse(response.body)
    binding.pry
   
    end 
end 