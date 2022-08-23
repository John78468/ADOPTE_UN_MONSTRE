class Contract < ApplicationRecord
  belongs_to :monster
  belongs_to :user

  validates :battles, presence: true
  validates_uniqueness_of :monster_id, conditions: -> { where(actif: true) }
end
