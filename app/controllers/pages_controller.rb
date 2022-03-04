class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home]
  before_action :get_select_task, only: [:update, :destroy]

  def home
  end

  def dashboard
    @gardens = Garden.all
    @garden = Garden.find(params[:garden_id])
    @garden_users = GardenUser.all
    @users = User.all

    @select_tasks = SelectTask.all
    @completed_tasks = SelectTask.select {|task| task[:status] == true }.last(5).reverse
    @tasks = Task.all

    @gardens = Garden.all
    @select_task = SelectTask.new
    @tasks = Task.all
  end
end
