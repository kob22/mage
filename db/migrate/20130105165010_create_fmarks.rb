class CreateFmarks < ActiveRecord::Migration
  def change
    create_table :fmarks do |t|
      t.integer :student_id
      t.string :mark
      t.string :note

      t.timestamps
    end
  end
end
