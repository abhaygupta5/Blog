class RemoveSpamFromPost < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :spam, :string
    remove_column :posts, :integer, :string
  end
end
