class AddMonsterLevel < ActiveRecord::Migration[7.0]
  def change
    add column :monster, :level, :integer
    add column :monster, :actif, :boolean
  end
end
