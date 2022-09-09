class Createuser < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :lastname, null:false
      t.string :firstname, null:false
      t.string :email, null:false
      t.string :adresse
      t.date :birthday
      t.string :password_digest
      t.string :sexe
      t.float :rating
      t.integer :phone
      t.string :job
      t.string :description
      t.string :photo
      t.integer :earning
      t.timestamps
    end
  end
end
