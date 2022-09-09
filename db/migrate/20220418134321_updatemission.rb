class Updatemission < ActiveRecord::Migration[7.0]
  def change
    add_column :missions, :freelancer_id, :integer , foreign_key: true
    add_index :missions, :freelancer_id
  end
end
