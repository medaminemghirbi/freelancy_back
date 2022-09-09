class Updatefarvoris < ActiveRecord::Migration[7.0]
  def change
    add_index :favoris, [:mission_id, :user_id], unique: true
  end
end
