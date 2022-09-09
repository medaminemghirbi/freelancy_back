class Addcountermission < ActiveRecord::Migration[7.0]
  def change
    add_column :missions, :requests_count, :integer, default: 0
  end
end
