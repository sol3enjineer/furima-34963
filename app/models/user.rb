class User < ApplicationRecord
  has_many :items
  #has_many :orders
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
with_options presence: true do
  validates :nickname
  validates :email
  validates :password, format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}
  validates :birthday
end
  with_options presence: true, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "is invalid. Input full-width characters."} do
    validates :firstname
    validates :lastname
  end

  with_options presence: true, format: {with: /\A[ァ-ヶー]+\z/, message: "is invalid. Input full-width characters."} do
    validates :firstname_kana
    validates :lastname_kana
  end
end



