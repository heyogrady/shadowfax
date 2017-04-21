class AddUserAttributes < ActiveRecord::Migration[4.2]
  def change
    add_column :users, :last_name, :string
    add_column :users, :first_name, :string
    add_column :users, :role, :string, default: 'standard'
  end
end
