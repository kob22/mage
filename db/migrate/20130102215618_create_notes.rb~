class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.integer :student_id
      t.integer :lab_class_id
      t.string :note
      t.date :date

      t.timestamps
    end
  end
end
