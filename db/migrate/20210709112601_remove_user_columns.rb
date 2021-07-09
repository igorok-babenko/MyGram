class RemoveUserColumns < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :name
    remove_column :users, :bio
    add_column :users, :name, :string, null: false
    add_column :users, :bio, :string, null: false
  end
end
