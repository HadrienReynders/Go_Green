class AddColumnPlantUrlToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :plant_url, :string
  end
end
