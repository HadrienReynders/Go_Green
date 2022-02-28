class CreateUserTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :user_tasks do |t|
      t.references :select_task, null: false, foreign_key: true

      t.timestamps
    end
  end
end
