class RenameTestsToUsertests < ActiveRecord::Migration
  def change
    rename_table :tests, :usertests
  end
end
