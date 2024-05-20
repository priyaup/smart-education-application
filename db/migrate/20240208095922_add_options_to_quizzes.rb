class AddOptionsToQuizzes < ActiveRecord::Migration[7.0]
  def change
    add_column :quizzes, :options, :text
  end
end
