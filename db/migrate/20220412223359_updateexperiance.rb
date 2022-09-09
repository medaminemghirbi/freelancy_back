class Updateexperiance < ActiveRecord::Migration[7.0]
  def change
    add_column :experiences, :langugage, :string
    add_column :experiences, :languagerating, :integer

  end
end
