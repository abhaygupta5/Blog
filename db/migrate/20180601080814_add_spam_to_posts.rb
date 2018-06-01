class AddSpamToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :spam, :integer, default: 0
  end
end
