class DeleteTableLikesAndAddingAgain < ActiveRecord::Migration[6.1]
  def change
    drop_table :likes

    create_table :likes do |t|
      t.integer :user_id
      t.integer :post_id
    end

    add_foreign_key :likes, :users, column: :user_id
    add_foreign_key :likes, :posts, column: :post_id
  end
end
