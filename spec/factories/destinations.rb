FactoryBot.define do
  factory :destination do
    name {Faker::Address.city}
    zip {Faker::Address.zip}
    description {Faker::Lorem.sentence}
    image_url {Faker::Placeholdit.image}
    lat {Faker::Address.latitude}
    lon {Faker::Address.longitude}
  end
end
