class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.integer :student_id
      t.integer :lab_class_id
      t.text :note
      t.date :date

      t.timestamps
    end
  end
end
