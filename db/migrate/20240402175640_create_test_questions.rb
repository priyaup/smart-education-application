class CreateTestQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :test_questions do |t|
      t.string :question
      t.text :options
      t.string :correct_option

      t.timestamps
    end
  end
end
