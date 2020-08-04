require 'rails_helper'

describe 'Session Serializer' do 
  it "returns image url" do
  
    post "/api/v1/sessions", params: {
        "email": "whatever@example.com",
        "password": "password"
        }
    expect(response).to be_successful  
    session = JSON.parse(response.body, symbolize_names: true)
    session_status = JSON.parse(response.status, symbolize_names: true)
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
    expect(session_status).to eq(200)   
  end 
end 