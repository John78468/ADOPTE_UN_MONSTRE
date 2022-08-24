class Monster < ApplicationRecord
  belongs_to :user
  has_many :contracts
  has_one_attached :image

  validates :name, :specie, :description, :image, :price, presence: true
end
