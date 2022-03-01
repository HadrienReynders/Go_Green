class CreateSelectTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :select_tasks do |t|
      t.references :user, null: false, foreign_key: true
      t.references :task, null: false, foreign_key: true

      t.timestamps
    end
  end
end
