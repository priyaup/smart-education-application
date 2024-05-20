class AddScoreToTestQuestions < ActiveRecord::Migration[7.0]
  def change
    add_column :test_questions, :score, :integer
  end
end
