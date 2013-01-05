class PresenceStringToInteger < ActiveRecord::Migration
  def up
    change_table :presences do |t|
      t.remove :presence
      t.integer :presence

    end
  end

  def down
  end
end
