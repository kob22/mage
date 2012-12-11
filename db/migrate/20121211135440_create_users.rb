class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :title
      t.string :name
      t.string :surname
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
