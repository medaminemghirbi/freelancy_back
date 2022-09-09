class AddfreelancerLanguage < ActiveRecord::Migration[7.0]
  def change
     
      create_table :freelancer_languages do |t|
        t.references :user , null: false, foreign_key: true
        t.references :language , null: false, foreign_key: true
        t.integer :languagerate , null:false
        t.timestamps
      end
    end
  end

