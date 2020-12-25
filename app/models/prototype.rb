class Prototype < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :users
  # belong_to :
  has_one_attached :image
end
