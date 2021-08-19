class Formobject < ApplicationRecord
    include ActiveModel::Model
    attr_accessor :postal_code, :prefecture_id, :municipalities, :address, :building_name, :telephone_number, :user_id, :item_id, :token

    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    
    with_options presence: true do
        validates :postal_code
        validates :prefecture_id, numericality: { other_than: 1 }
        validates :municipalities
        validates :address
        validates :telephone_number, format: { with: /\A[0-9]+\z/ }, length: { in: 9..12 }
        validates :token 
        validates :user_id
        validates :item_id
    end

    def save
        order = Order.create(item_id: item_id, user_id: user_id )
        Address.create(postal_code: postal_code, prefecture_id: prefecture_id, municipalities: municipalities, address: address, building_name: building_name, telephone_number: telephone_number, orders_id: orders_id)
    end
end

