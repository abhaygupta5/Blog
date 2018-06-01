class RemoveSpamFromPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :spam, :integer
  end
end
