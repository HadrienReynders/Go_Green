class TasksController < ApplicationController
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    @tasks = Task.all
    @select_task = SelectTask.new
    # @select_task = Task.find(id)
  end
end
