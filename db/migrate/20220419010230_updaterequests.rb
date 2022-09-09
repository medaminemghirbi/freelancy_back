class Updaterequests < ActiveRecord::Migration[7.0]
  def change
    add_column :requests, :mission_id, :integer
    add_index  :requests, :mission_id
    add_column :requests, :freelancer_id, :integer
    add_index  :requests, :freelancer_id
    add_index :requests, [:mission_id, :freelancer_id], unique: true
  end
end
