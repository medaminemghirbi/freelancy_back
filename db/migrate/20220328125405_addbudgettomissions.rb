class Addbudgettomissions < ActiveRecord::Migration[7.0]
  def change
    add_column :missions, :budget, :integer
  end
end
