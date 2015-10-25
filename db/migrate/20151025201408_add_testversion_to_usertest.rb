class AddTestversionToUsertest < ActiveRecord::Migration
  def self.down
       remove_column :users, :client_id
   end
end
