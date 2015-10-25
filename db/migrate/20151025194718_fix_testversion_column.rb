class FixTestversionColumn < ActiveRecord::Migration
  def change
    rename_column :testversions, :open, :isopen
  end
end
