class DestinationSerializer
  def self.format_destinations(destinations)
    destinations.map do |destination|
      {
        id: destination.id,
        name: destination.name,
        zip: destination.zip,
        description: destination.description,
        image_url: destination.image_url,
        lat: destination.lat,
        lon: destination.lon,
        popularity: destination.popularity
      }
    end
  end
end