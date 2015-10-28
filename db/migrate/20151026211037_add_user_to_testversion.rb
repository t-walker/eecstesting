class AddUserToTestversion < ActiveRecord::Migration
  def change
    add_reference :testversions, :user, index: true, foreign_key: true
  end
end
