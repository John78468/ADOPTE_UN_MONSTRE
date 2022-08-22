class Contract < ApplicationRecord
  belongs_to :monster
  belongs_to :user

  validates :battles, presence: true
end
