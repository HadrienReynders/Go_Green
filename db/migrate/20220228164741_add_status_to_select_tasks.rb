class AddStatusToSelectTasks < ActiveRecord::Migration[6.1]
  def change
    add_column :select_tasks, :status, :boolean, default: false
  end
end
