FactoryBot.define do
  factory :formobject do
    postal_code { '123-4567' }
    prefecture_id { 2 }
    municipalities { '東京市' }
    address { '1-1' }
    building_name { '東京ハイツ' }
    telephone_number { '09012345678' }
    token { 'token' }
  end
end
