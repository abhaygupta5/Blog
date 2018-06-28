class AddAttachmentTimelineToUsers < ActiveRecord::Migration[5.2]
  def self.up
    change_table :users do |t|
      t.attachment :timeline
    end
  end

  def self.down
    remove_attachment :users, :timeline
  end
end
