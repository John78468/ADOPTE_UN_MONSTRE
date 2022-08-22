class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :monsters
  has_many :contracts
  has_many :selected_monsters, through: :contracts, source: :monster #monstres reservés par moi
  has_many :enlisted_monsters, through: :monsters, source: :contract #monstres sur lesquels j'ai des réservations

  validates :name, presence: true
end
