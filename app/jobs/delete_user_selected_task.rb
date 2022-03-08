class DeleteUserSelectedTask < ApplicationJob
  queue_as :default

  def perform(user)
    puts "Clearing selected tasks at midnight..."
    # TODO: clear selected tasks at midnight.

    user.select_tasks.each { |task| task.destroy if  task.status == false }

    puts "Done! Cleared selected tasks"
  end
end
