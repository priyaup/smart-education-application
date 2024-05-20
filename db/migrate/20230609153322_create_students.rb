class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :date_of_birth
      t.integer :class_name
      t.string :blood_group
      t.string :father_name

      t.timestamps
    end
  end
end
