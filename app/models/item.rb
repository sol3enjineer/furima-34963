class Item < ApplicationRecord
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :user
    belongs_to :category
    belongs_to :prefecture
    belongs_to :product_condition
    belongs_to :shipping_charge
    belongs_to :shipping_date
    has_one_attached :image
    has_one :order

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
end
