class CreateLabMarks < ActiveRecord::Migration
  def change
    create_table :lab_marks do |t|
      t.string :mark
      t.string :description
      t.integer :presence_id

      t.timestamps
    end
  end
end
