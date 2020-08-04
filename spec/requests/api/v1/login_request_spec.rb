require 'rails_helper'

describe 'Login Request' do 
  it "sucessful log in request returns user info and api key" do
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
    expect(session[:data][:type]).to eq("user")
    expect(session[:data][:id]).to_not be_empty
    expect(session[:data][:attributes][:email]).to eq("whatever@example.com")
    expect(session[:data][:attributes][:api_key]).to_not be_empty 
  end 
  it "incorrect password in log in request returns incorrect password" do
             post "/api/v1/users", params: {
      "email": "whatever@example.com",
      "password": "password",
      "password_confirmation": "password"
    }
  
    post "/api/v1/sessions", params: {
        "email": "whatever@example.com",
        "password": "passwor"
        }  
    session = JSON.parse(response.body, symbolize_names: true)
    expect(session).to eq({:errors=>"Incorrect Password", :status=>400})     

  end 
  it "incorrect email in log in request returns invalid credentials error " do

        post "/api/v1/sessions", params: {
        "email": "whatever@example.com",
        "password": "password"
        }
    session = JSON.parse(response.body, symbolize_names: true)
    expect(session).to eq({:errors=>"Invalid Credentials", :status=>400})
  end     
end 