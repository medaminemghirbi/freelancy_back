class CreateFavoris < ActiveRecord::Migration[7.0]
  def change
    create_table :favoris do |t|

    
          t.belongs_to :mission , foreign_key: true
          t.belongs_to :user , foreign_key: true
    
          t.timestamps
        end
    end
  end
