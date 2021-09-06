class AddNameToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :first_name, :string, limit: 50, null: false
    add_column :users, :last_name,  :string, limit: 50, null: false
  end
end
