class CreateMarks < ActiveRecord::Migration
  def change
    create_table :marks do |t|
      t.integer :student_id
      t.integer :lab_class_id
      t.string :mark
      t.date :date

      t.timestamps
    end
  end
end
