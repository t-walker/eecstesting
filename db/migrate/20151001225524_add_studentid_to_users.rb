class AddStudentidToUsers < ActiveRecord::Migration
  def change
    add_column :users, :studentid, :string
  end
end
