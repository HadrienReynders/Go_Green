namespace :user do
  desc "Clear selected tasks at midnight"
  task :delete_selected_tasks, [:user_id] => :environment do |t, args|
    DeleteUserSelectedTask.perform_now(user)
    # rake task will return when job is _done_
  end
end
