class AddPostIdToReports < ActiveRecord::Migration[5.2]
  def change
    add_column :reports, :post_id, :integer
    add_index :reports, :post_id
  end
end
