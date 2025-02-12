class ModifyUsersTable < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :first_name, :string, null: false
    add_column :users, :last_name, :string, null: false
    add_column :users, :email, :string, null: false

    remove_column :users, :name, :string
  end
end
