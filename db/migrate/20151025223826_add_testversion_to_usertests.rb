class AddTestversionToUsertests < ActiveRecord::Migration
  def change
    add_reference :usertests, :testversion, index: true, foreign_key: true
  end
end
