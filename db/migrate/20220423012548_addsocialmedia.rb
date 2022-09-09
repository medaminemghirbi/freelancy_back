class Addsocialmedia < ActiveRecord::Migration[7.0]
  def change
    add_column :users , :github , :string 
    add_column :users , :facebook , :string
    add_column :users , :instagram  , :string 
    add_column :users , :linkedin  , :string
  end
end
