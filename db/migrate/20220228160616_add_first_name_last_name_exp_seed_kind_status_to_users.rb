class AddFirstNameLastNameExpSeedKindStatusToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :exp, :integer
    add_column :users, :seed_kind, :string
    add_column :users, :status, :integer
  end
end
