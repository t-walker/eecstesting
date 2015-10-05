class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :prompt
      t.string :possible1
      t.string :possible2
      t.string :possible3
      t.string :possible4
      t.string :correct

      t.timestamps null: false
    end
  end
end
