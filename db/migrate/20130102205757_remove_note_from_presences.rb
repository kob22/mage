class RemoveNoteFromPresences < ActiveRecord::Migration
  def up
    remove_column :presences, :note
  end

  def down
    add_column :presences, :note, :string
  end
end
