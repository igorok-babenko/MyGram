class AddDeletedDefaultValuesToUsers < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :name, :string, :default => false
    change_column :users, :bio, :string, :default => false
  end
end
