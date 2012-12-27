class RemoveMarkFromLabCLass < ActiveRecord::Migration
  def up
	remove_column :lab_classes, :mark
  end

  def down
  end
end
