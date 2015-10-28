class CreateQuestionsTestversionsJoinTable < ActiveRecord::Migration
  def change
    create_table :questions_testversions, id: false do |t|
      t.integer :testversion_id
      t.integer :question_id
    end
  end
end
