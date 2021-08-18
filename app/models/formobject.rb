class Formobject < ApplicationRecord
    include ActiveModel::Model
    attr_accessor :order, :postal_code, :prefecture_id, :municipalities, :address, :building_name, :telephone_number, :user_id, :item_id

    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    
    with_options presence: true do
        validates :order
        validates :postal_code
        validates :prefecture_id
        validates :municipalities
        validates :address
        validates :building_name
        validates :telephone_number 
    end
    
    def save
        order = Order.create(item_id: item_id, user_id: user_id)
        Address.create(order: order, postal_code: postal_code, prefecture_id: prefecture_id, municipalities: municipalities, address: address, building_name: building_name, telephone_number: telephone_number)
    end
end
