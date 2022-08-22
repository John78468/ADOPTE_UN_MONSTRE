class Monster < ApplicationRecord
  belongs_to :user
  has_many :contracts

  validates :name, :specie, :description, :image, :price, presence: true
end
