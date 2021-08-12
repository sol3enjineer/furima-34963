FactoryBot.define do
  factory :item do
    name {'あああ'}
    product_description {'本です'}
    category_id { 3 }
    product_condition_id { 2 }
    shipping_charge_id { 2 }
    prefecture_id { 2 }
    shipping_date_id { 2 }
    price { 500 }

    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/tteesstt.png'), filename: 'tteesstt.png')
    end 
  end
end
