class CreateSyllabuses < ActiveRecord::Migration[7.0]
  def change
    create_table :syllabuses do |t|
      t.string :title
      t.string :description
      t.references :student, index: true, foreign_key: true

      t.timestamps
    end
  end
end
