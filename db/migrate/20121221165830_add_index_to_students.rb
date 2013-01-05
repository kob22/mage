class AddIndexToStudents < ActiveRecord::Migration
  def change
    add_index :students, [:name, :surname]
  end
end
