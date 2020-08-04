require 'rails_helper'

describe 'Image Serializer' do 
  it "returns image url" do
  
      post "/api/v1/users", params: {
      "email": "whatever@example.com",
      "password": "password",
      "password_confirmation": "password"
    }
        expect(response).to be_successful  

        post "/api/v1/users", params: {
      "email": "whatever@example.com",
      "password": "password",
      "password_confirmation": "password"
    }
    user = JSON.parse(response.body, symbolize_names: true)
    expect(user).to eq({:errors=>["Email has already been taken"], :status=>400})     
  end 
end 