class SelectTasksController < ApplicationController
  before_action :get_select_task, only: [:update, :destroy]

  def new
    @gardens = Garden.all
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
      if @select_task.save
        # DeleteUserSelectedTask.set(wait_until: DateTime.now.end_of_day ).perform_later(current_user)  # <- The job is queued
      end
    end
    # redirect_to dashboard_path(garden_id: GardenUser.order(garden_id: :asc).find { |gardenuser| gardenuser.user_id == current_user.id }.garden_id)
     redirect_to dashboard_path(garden_id: params[:select_task][:garden_id])
  end

  def destroy
    @select_task.destroy
    redirect_back(fallback_location: root_path)
  end

  def update
    @select_task.status = true
    @select_task.save
    @select_task.user.exp += @select_task.task.exp
    @select_task.user.save!
    redirect_back(fallback_location: root_path)
  end

  private

  def get_select_task
    @select_task = SelectTask.find(params[:id])
  end

  # def select_task_params
  #   params.require(:select_task).permit(:task_id)
  # end
end
