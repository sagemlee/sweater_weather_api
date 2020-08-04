require 'rails_helper'

describe 'Session Serializer' do 
  it "returns image url" do

        post "/api/v1/sessions", params: {
        "email": "whatever@example.com",
        "password": "password"
        }
    expect(response).to be_successful  
    expect(response.status).to eq(200)     
    session = JSON.parse(response.body, symbolize_names: true)

     post "/api/v1/users", params: {
      "email": "whatever@example.com",
      "password": "password",
      "password_confirmation": "password"
    }
  
    post "/api/v1/sessions", params: {
        "email": "whatever@example.com",
        "password": "password"
        }
    expect(response).to be_successful  
    expect(response.status).to eq(200)     
    session = JSON.parse(response.body, symbolize_names: true)
    binding.pry

   # session_status = JSON.parse(status, symbolize_names: true)
    expect(session).to eq({
  "data": {
    "type": "users",
    "id": "1",
    "attributes": {
      "email": "whatever@example.com",
      "api_key": "jgn983hy48thw9begh98h4539h4"
    }
  }
})   
  end 
end 