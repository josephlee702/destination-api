require 'rails_helper'

describe "Destinations API" do
  it "sends a list of destinations" do
    create_list(:destination, 3)

    get '/api/v2/destinations'

    expect(response).to be_successful

    destinations = JSON.parse(response.body, symbolize_names: true)

    expect(destinations.count).to eq(3)

    destinations.each do |destination|
      expect(destination).to have_key(:id)
      expect(destination[:id]).to be_an(Integer)

      expect(destination).to have_key(:name)
      expect(destination[:name]).to be_a(String)

      expect(destination).to have_key(:zip)
      expect(destination[:zip]).to be_a(String)

      expect(destination).to have_key(:description)
      expect(destination[:description]).to be_a(String)

      expect(destination).to have_key(:image_url)
      expect(destination[:image_url]).to be_a(String)

      expect(destination).to have_key(:lat)
      expect(destination[:lat]).to be_a(Float)

      expect(destination).to have_key(:lon)
      expect(destination[:lon]).to be_a(Float)

      expect(destination).to have_key(:popularity)
      expect(destination[:popularity]).to be_an(String)

      expect(destination).to_not have_key(:number_sold)
    end
  end
end