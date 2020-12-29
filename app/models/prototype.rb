class Prototype < ApplicationRecord
  # devise :database_authenticatable, :registerable
  #        :recoverable, :rememberable, :validatable
  has_many :comments, dependent: :destroy
  belongs_to :user

  has_one_attached :image #:title, :catch_copy, :concept, 

  validates :title, presence: true
  validates :catch_copy, presence: true
  validates :concept, presence: true
  validates :image, presence: true


end
