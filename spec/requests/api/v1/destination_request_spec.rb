require 'rails_helper'

describe "Destinations API" do
  it "sends a list of destinations" do
    create_list(:destination, 3)

    get '/api/v1/destinations'

    expect(response).to be_successful

    destinations = JSON.parse(response.body, symbolize_names: true)

    destinations.each do |destination|
      expect(destination).to have_key(:name)
      expect(destination[:name]).to be_an(String)

      expect(destination).to have_key(:zip)
      expect(destination[:zip]).to be_a(String)

      expect(destination).to have_key(:description)
      expect(destination[:description]).to be_a(String)

      expect(destination).to have_key(:image_url)
      expect(destination[:image_url]).to be_a(String)

      expect(destination).to have_key(:lat)
      expect(destination[:lat]).to be_a(Float)

      expect(destination).to have_key(:lon)
      expect(destination[:lon]).to be_an(Float)
    end
  end

  it "can get one book by its id" do
    id = create(:destination).id
  
    get "/api/v1/destinations/#{id}"
  
    destination = JSON.parse(response.body, symbolize_names: true)
  
    expect(response).to be_successful
  
    expect(destination).to have_key(:name)
    expect(destination[:name]).to be_an(String)

    expect(destination).to have_key(:zip)
    expect(destination[:zip]).to be_a(String)

    expect(destination).to have_key(:description)
    expect(destination[:description]).to be_a(String)

    expect(destination).to have_key(:image_url)
    expect(destination[:image_url]).to be_a(String)

    expect(destination).to have_key(:lat)
    expect(destination[:lat]).to be_a(Float)

    expect(destination).to have_key(:lon)
    expect(destination[:lon]).to be_an(Float)
  end

  it "can create a new destination" do
    destination_params = ({
                    name: 'Joseph Town',
                    zip: '12345',
                    description: 'A town of Josephs.',
                    image_url: nil,
                    lat: 55.0,
                    lon: 41.4
                  })
    headers = {"CONTENT_TYPE" => "application/json"}
  
    # We include this header to make sure that these params are passed as JSON rather than as plain text
    post "/api/v1/destinations", headers: headers, params: JSON.generate(destination: destination_params)
    created_destination = Destination.last
  
    expect(response).to be_successful
    expect(created_destination.name).to eq(destination_params[:name])
    expect(created_destination.zip).to eq(destination_params[:zip])
    expect(created_destination.description).to eq(destination_params[:description])
    expect(created_destination.image_url).to eq(destination_params[:image_url])
    expect(created_destination.lat).to eq(destination_params[:lat])
    expect(created_destination.lon).to eq(destination_params[:lon])
  end

  it "can update an existing destination" do
    id = create(:destination).id
    previous_destination = Destination.last.name
    destination_params = { name: "Joanna's Town" }
    headers = {"CONTENT_TYPE" => "application/json"}
  
    patch "/api/v1/destinations/#{id}", headers: headers, params: JSON.generate({destination: destination_params})
    destination = Destination.find_by(id: id)
  
    expect(response).to be_successful
    expect(destination.name).to_not eq(previous_destination)
    expect(destination.name).to eq("Joanna's Town")
  end

  it "can destroy an destination" do
    destination = create(:destination)
  
    expect(Destination.count).to eq(1)
  
    delete "/api/v1/destinations/#{destination.id}"
  
    expect(response).to be_successful
    expect(Destination.count).to eq(0)
    expect{Destination.find(destination.id)}.to raise_error(ActiveRecord::RecordNotFound)
  end
end