class AddSurnameToStudents < ActiveRecord::Migration
  def change
    add_column :students, :surname, :string
  end
end
