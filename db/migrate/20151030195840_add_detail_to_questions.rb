class AddDetailToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :detail, :string
  end
end
