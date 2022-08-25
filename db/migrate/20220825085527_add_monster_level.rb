class AddMonsterLevel < ActiveRecord::Migration[7.0]
  def change
    add_column :monsters, :level, :integer
    add_column :monsters, :actif, :boolean
  end
end
