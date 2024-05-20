class AddLearnerTypeToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :learner_type, :string
  end
end
