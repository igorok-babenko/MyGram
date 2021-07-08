class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :content, null: false, default: ""
      t.integer :likes, default: 0

      t.timestamps
    end
  end
end
