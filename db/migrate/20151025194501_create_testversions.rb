class CreateTestversions < ActiveRecord::Migration
  def change
    create_table :testversions do |t|
      t.string :title
      t.datetime :startdate
      t.datetime :enddate
      t.boolean :open

      t.timestamps null: false
    end
  end
end
