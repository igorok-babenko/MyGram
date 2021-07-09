class AddToUserNameAndBio < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string, null: false, default: ""
    add_column :users, :bio, :string, null: false, default: ""
  end
end
