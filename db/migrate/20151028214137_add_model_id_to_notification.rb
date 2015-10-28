class AddModelIdToNotification < ActiveRecord::Migration
  def change
    add_column :notifications, :model_id, :integer
  end
end
