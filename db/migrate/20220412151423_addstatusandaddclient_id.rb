class AddstatusandaddclientId < ActiveRecord::Migration[7.0]
    def change
      remove_column :missions, :user_id, :integer
      add_column :missions, :client_id, :integer
      add_index  :missions, :client_id
  
      create_table :Reqeuest do |t|
        t.integer :status , null:false
      end
    end
  

  
end




