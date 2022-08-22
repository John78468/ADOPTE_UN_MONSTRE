class AddCoinToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :coin, :integer
  end
end
