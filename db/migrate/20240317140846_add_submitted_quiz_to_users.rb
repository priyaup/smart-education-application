class AddSubmittedQuizToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :submitted_quiz, :boolean
  end
end
