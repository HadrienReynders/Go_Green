class TasksController < ApplicationController
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    @tasks = Task.all
    # @select_task = Select_task.new
    @select_task = Task.find(:task_id)
  end
end
