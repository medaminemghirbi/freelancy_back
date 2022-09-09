class Createmissionlanguages < ActiveRecord::Migration[7.0]
    def change
      create_table :mission_languages do |t|
        t.references :mission , null: false, foreign_key: true
        t.references :language , null: false, foreign_key: true
        t.timestamps
      end
    end
  end