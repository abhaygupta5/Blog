class RemoveSpamFromReports < ActiveRecord::Migration[5.2]
  def change
    remove_column :reports, :spam, :integer
    
  end
end
