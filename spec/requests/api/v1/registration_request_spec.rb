require 'rails_helper'

describe 'Image Serializer' do 
    it "returns image url" do
  
    post "/api/v1/users", params: {
  "email": "whatever@example.com",
  "password": "password"
  "password_confirmation": "password"
}
    expect(response).to be_successful  
    
    user = JSON.parse(response.body)
    expect(user).to eq({
  "data": {
    "type": "users",
    "id": "1",
    "attributes": {
      "email": "whatever@example.com",
      "api_key": "jgn983hy48thw9begh98h4539h4"
    }
  }
})  
    binding.pry
   
    end 
end 