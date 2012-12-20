class CreatePresences < ActiveRecord::Migration
  def change
    create_table :presences do |t|
      t.integer :student_id
      t.integer :lab_class_id
      t.string :presence
      t.string :note

      t.timestamps
    end
  end
end
