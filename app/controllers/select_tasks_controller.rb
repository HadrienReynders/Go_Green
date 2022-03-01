class SelectTasksController < ApplicationController
  def new
    @select_task = SelectTask.new
    @tasks = Task.all
  end

  def index
    @select_tasks = SelectTask.all
    @tasks = Task.all
  end

  def create
    tasks_id = params["select_task"]["task_id"]
    tasks_id.shift
    tasks_id.each do |task_id|
      @select_task = SelectTask.new(task_id: task_id.to_i, user_id: current_user.id)
      @select_task.save
    end
    redirect_to dashboard_path
  end

  #private

  # def select_task_params
  #   params.require(:select_task).permit(:task_id)
  # end
end
