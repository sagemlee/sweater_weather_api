require 'rails_helper'

describe 'Forecast Enpoint' do 
    it "returns weather for a specified location" do
  
    # location = SearchResults.new 
    # expect(location.lat("Denver,CO")).to eq(39.738453)
    # expect(location.lng("Denver,CO")).to eq(-104.984853)
    # expect(location.city("Denver,CO")).to eq("Denver,CO")
    # expect(location.country("Denver,CO")).to eq("US")

    get "/api/v1/forecast", params: {location: "denver,co"}
    expect(response).to be_successful  
    
    forecast = JSON.parse(response.body, symbolize_names: true)

    expect(forecast[:data][:attributes][:time]).to_not be_empty
    expect(forecast[:data][:attributes][:temp]).to_not be_nil
    expect(forecast[:data][:attributes][:temp_high]).to_not be_nil
    expect(forecast[:data][:attributes][:temp_low]).to_not be_nil
    expect(forecast[:data][:attributes][:sunrise]).to_not be_empty
    expect(forecast[:data][:attributes][:sunset]).to_not be_empty
    expect(forecast[:data][:attributes][:feels_like]).to_not be_nil
    expect(forecast[:data][:attributes][:humidity]).to_not be_nil
    expect(forecast[:data][:attributes][:uvi]).to_not be_nil
    expect(forecast[:data][:attributes][:visibility]).to_not be_nil
    expect(forecast[:data][:attributes][:description]).to_not be_empty
    expect(forecast[:data][:attributes][:icon]).to_not be_empty
    expect(forecast[:data][:attributes][:days]).to_not be_empty
    expect(forecast[:data][:attributes][:city]).to eq("Denver,CO")
    expect(forecast[:data][:attributes][:country]).to eq("US")

    end 
end 