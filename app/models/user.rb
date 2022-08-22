class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :monsters
  has_many :contracts
  has_many :enlist_monsters, through: :contracts, source: :monster

  validates :name, :email, :password, presence: true
end
