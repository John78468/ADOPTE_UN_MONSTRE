class Contract < ApplicationRecord
  belongs_to :monster
  belongs_to :user
  validates_uniqueness_of :monster_id, conditions: -> { where(actif: true) }
  validates :battles, presence: true,  numericality: { only_integer: true, greater_than_or_equal_to: 1 }
end
