class Delete < ActiveRecord::Migration[7.0]
  def change
    remove_column :categories, :avatar, :string
  end
end
