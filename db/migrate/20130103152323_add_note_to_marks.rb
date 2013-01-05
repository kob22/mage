class AddNoteToMarks < ActiveRecord::Migration
  def change
    add_column :marks, :note, :string
  end
end
