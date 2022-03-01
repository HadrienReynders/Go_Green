class TasksController < ApplicationController
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    @tasks = Task.all
  end
end
