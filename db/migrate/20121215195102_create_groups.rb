class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.integer :subject_id
      t.string :group
      t.string :day
      t.string :week
      t.time :time

      t.timestamps
    end
  end
end
