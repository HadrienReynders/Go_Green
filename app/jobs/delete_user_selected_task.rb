class DeleteUserSelectedTask < ApplicationJob
  queue_as :default

  def perform(user)
    puts "Clearing selected tasks at midnight..."
    # TODO: clear selected tasks at midnight.
    time_to_midnight = 86400 - Time.now.seconds_since_midnight

    sleep time_to_midnight

    SelectTask.all.each { |task| task.destroy if task.user_id == user.id && task.status == false }

    puts "Done! Cleared selected tasks"
  end
end
