FactoryBot.define do
  factory :purchase_address do
    Faker::Config.locale = :ja

    transient do
      address { Gimei.address }
    end

    postal_code     { '123-4567' }
    prefecture_id   { Faker::Number.between(from: 1, to: 47) }
    town            { address.city.kanji }
    house_number    { Faker::Address.building_number }
    phone_number    { Faker::Lorem.characters(number: 11, min_numeric: 11) }
    building_name   { Faker::Name.initials }
    token           { 'tok_abcdefghijk00000000000000000' }
  end
end
