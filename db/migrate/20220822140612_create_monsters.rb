class CreateMonsters < ActiveRecord::Migration[7.0]
  def change
    create_table :monsters do |t|
      t.string :name
      t.string :specie
      t.string :description
      t.string :image
      t.integer :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
