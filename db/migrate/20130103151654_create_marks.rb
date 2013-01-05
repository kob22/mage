class CreateMarks < ActiveRecord::Migration
  def change
    create_table :marks do |t|
      t.integer :lab_class_id
      t.integer :student_id
      t.string :mark
      t.datetime :date

      t.timestamps
    end
  end
end
