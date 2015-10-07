class ChangeTestIdToUsertestId < ActiveRecord::Migration
  def change
    rename_column :responses, :test_id, :usertest_id
  end
end
