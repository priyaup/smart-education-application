class ChangeClassNameInStudents < ActiveRecord::Migration[7.0]
  def change
    change_column :students, :class_name, :string
  end
end
