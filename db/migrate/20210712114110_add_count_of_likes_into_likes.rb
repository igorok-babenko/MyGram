class AddCountOfLikesIntoLikes < ActiveRecord::Migration[6.1]
  def change
    add_column :likes, :count, :integer, default: 0
  end
end
