class Monster < ApplicationRecord
  belongs_to :user
  has_many :contracts
  has_many :users, trough: :contracts

  validates :name, :specie, :description, :image, :price, presence: true
end
