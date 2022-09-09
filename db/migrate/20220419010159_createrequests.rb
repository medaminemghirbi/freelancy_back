class Createrequests < ActiveRecord::Migration[7.0]
  def change
    create_table :requests do |t|
      t.integer :status , null:false ,default: 0
      t.timestamps
    end
  end
end