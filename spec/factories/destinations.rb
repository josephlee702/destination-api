FactoryBot.define do
  factory :destination do
    name {Faker::Address.city}
    zip {Faker::Address.zip}
    description {Faker::Lorem.sentence}
    image_url {Faker::Placeholdit.image}
    lat {Faker::Address.latitude}
    lon {Faker::Address.longitude}
    popularity { "very popular" }
    number_sold { 100 }
  end
end
