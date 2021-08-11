class Item < ApplicationRecord
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :user
    has_one_attached :image
    belongs_to :category
    belongs_to :prefecture
    belongs_to :product_condition
    belongs_to :shipping_charge
    belongs_to :shipping_date

    #validates :presence: true
    validates :category_id, :prefecture_id, :product_condition_id, :shipping_charge_id, :shipping_date_id, numericality: { other_than: 1, message: "can't be blank" } 
end
