class Item < ApplicationRecord
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :user
    has_one_attached :image
    
    with_options presence: true do
    validates :name
    validates :category_id
    validates :prefecture_id
    validates :product_condition_id
    validates :shipping_charge_id
    validates :shipping_date_id
    validates :product_description
    validates :price
    validates :image
    end

    validates :price, inclusion: { in: 300..9999999 }
    validates :price, format: { with: /\A[0-9]+\z/ }
    
    with_options presence: true, numericality: { other_than: 1 } do
        validates :category_id
        validates :product_condition_id
        validates :shipping_charge_id
        validates :prefecture_id
        validates :shipping_date_id
end
