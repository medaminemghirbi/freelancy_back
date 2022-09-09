class Updatereviews < ActiveRecord::Migration[7.0]
  def change
    add_index :reviews, [:mission_id, :user_id], unique: true
  end
end
