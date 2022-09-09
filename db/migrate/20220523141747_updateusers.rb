class Updateusers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :RIB , :integer 
   
  end
end
