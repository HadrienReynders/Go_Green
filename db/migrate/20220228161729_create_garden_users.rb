class CreateGardenUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :garden_users do |t|
      t.references :garden, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
