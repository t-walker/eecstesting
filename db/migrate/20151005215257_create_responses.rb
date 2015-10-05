class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.references :user, index: true, foreign_key: true
      t.references :test, index: true, foreign_key: true
      t.string :response_data
      t.boolean :correct

      t.timestamps null: false
    end
  end
end
