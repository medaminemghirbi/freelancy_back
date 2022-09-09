class Updatedatabase < ActiveRecord::Migration[7.0]
  def change
    remove_column :experiences, :langugage , :integer 
    
    remove_column :experiences, :languagerating , :integer 
    remove_column :reviews, :commentClient , :string 
    
    remove_column :reviews, :commentFreelancer , :string 
    add_index :freelancer_languages, [:language_id, :user_id], unique: true
  end
end
